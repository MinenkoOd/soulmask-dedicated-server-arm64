# Soulmask Dedicated Server on ARM64 with Box64

This Docker setup allows you to run a Soulmask dedicated server on ARM64 platforms (like Raspberry Pi, Apple Silicon, etc.) using Box64 for x86_64 emulation.

## Supported Platforms

- **Apple Silicon (M1/M2/M3)** - Uses optimized Box64 build
- **Raspberry Pi 5** - Supports both 4K and 16K page sizes
- **Raspberry Pi 4** - Includes legacy 0.2.7 version support
- **Raspberry Pi 3** - Basic ARM64 support
- **RK3588** - Rockchip ARM64 processors
- **Adlink** - Custom compiled version
- **Generic ARM64** - Fallback for other platforms

## Prerequisites

- Docker and Docker Compose installed
- ARM64 architecture system
- At least 4GB of RAM (8GB+ recommended)
- 10GB+ free disk space for the game files

## Quick Start

1. **Clone or download the files:**
   ```bash
   mkdir soulmask-server
   cd soulmask-server
   ```

2. **Place the required files:**
   - `Dockerfile` - Main Docker build file
   - `box64.sh` - Box64 wrapper script
   - `docker-compose.yml` - Docker Compose configuration

3. **Build and start the server:**
   ```bash
   docker-compose up -d --build
   ```

4. **Monitor the server:**
   ```bash
   docker-compose logs -f soulmask-server
   ```

## Configuration

### Server Settings

The server configuration files are located in:
- `./soulmask-config/LinuxServer/Game.ini` - Game settings
- `./soulmask-config/LinuxServer/Engine.ini` - Engine settings

### Default Settings

- **Server Name:** Soulmask Dedicated Server
- **Max Players:** 20
- **Game Port:** 7777 (UDP)
- **Query Port:** 27015 (UDP)
- **RCON Port:** 27020 (TCP)
- **PVP:** Disabled by default

### Customizing Server Settings

Edit the configuration files before starting the server:

```bash
# Edit game settings
nano ./soulmask-config/LinuxServer/Game.ini

# Edit engine settings
nano ./soulmask-config/LinuxServer/Engine.ini
```

Key settings in `Game.ini`:
```ini
[/Script/SoulMask.SMGameMode]
ServerName=Your Server Name
ServerPassword=YourPassword
MaxPlayers=20
EnablePVP=false
ServerPort=7777
```

## Usage Commands

### Using Docker Compose (Recommended)

```bash
# Start the server
docker-compose up -d

# Stop the server
docker-compose down

# View logs
docker-compose logs -f soulmask-server

# Restart the server
docker-compose restart soulmask-server

# Update and restart
docker-compose down
docker-compose up -d --build
```

### Using Docker Directly

```bash
# Build the image
docker build -t soulmask-server .

# Run the server
docker run -d \
  --name soulmask-server \
  -p 7777:7777/udp \
  -p 27015:27015/udp \
  -p 27020:27020/tcp \
  -v $(pwd)/soulmask-data:/home/steam/soulmask/WS/Saved \
  soulmask-server

# Update the server
docker exec soulmask-server /entrypoint.sh update-soulmask

# Access SteamCMD
docker exec -it soulmask-server /entrypoint.sh steamcmd

# Access shell
docker exec -it soulmask-server /entrypoint.sh bash
```

## Server Management

### Updating the Server

```bash
# Using Docker Compose
docker-compose exec soulmask-server /entrypoint.sh update-soulmask

# Or rebuild the container
docker-compose down
docker-compose up -d --build
```

### Backup Server Data

```bash
# Create backup
tar -czf soulmask-backup-$(date +%Y%m%d).tar.gz soulmask-data/

# Restore backup
tar -xzf soulmask-backup-YYYYMMDD.tar.gz
```

### View Server Status

```bash
# Check if server is running
docker-compose ps

# View resource usage
docker stats soulmask-dedicated-server

# Check server logs
docker-compose logs --tail=100 soulmask-server
```

## Troubleshooting

### Common Issues

1. **Server won't start:**
   - Check available memory (4GB+ required)
   - Verify ports are not in use
   - Check Docker logs for errors

2. **Poor performance:**
   - Increase Docker memory limits
   - Ensure sufficient CPU cores
   - Check Box64 optimization settings

3. **Connection issues:**
   - Verify firewall ports are open
   - Check Docker port mappings
   - Ensure correct IP address

### Performance Tuning

For better performance on specific platforms:

**Raspberry Pi 4:**
```bash
# Reduce memory usage
echo 'gpu_mem=16' >> /boot/config.txt

# Increase swap if needed
sudo dphys-swapfile swapoff
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

**Apple Silicon:**
```bash
# Ensure Rosetta 2 is not interfering
export BOX64_DYNAREC_STRONGMEM=1
```

### Debug Mode

To enable debug logging:

```bash
# Edit docker-compose.yml and add:
environment:
  - BOX64_LOG=1
  - BOX64_SHOWSEGV=1
```

### Log Files

- **Server logs:** `./soulmask-logs/soulmask.out.log`
- **Error logs:** `./soulmask-logs/soulmask.err.log`
- **Game logs:** `./soulmask-data/Logs/`

## Network Configuration

### Port Forwarding

If running behind a router, forward these ports:
- **7777/UDP** - Game traffic
- **27015/UDP** - Steam query
- **27020/TCP** - RCON (optional)

### Firewall Rules

```bash
# Ubuntu/Debian
sudo ufw allow 7777/udp
sudo ufw allow 27015/udp
sudo ufw allow 27020/tcp

# CentOS/RHEL
sudo firewall-cmd --permanent --add-port=7777/udp
sudo firewall-cmd --permanent --add-port=27015/udp
sudo firewall-cmd --permanent --add-port=27020/tcp
sudo firewall-cmd --reload
```

## Advanced Configuration

### Custom Box64 Settings

Create a custom `box64.sh` with your preferred settings:

```bash
export BOX64_DYNAREC_STRONGMEM=1
export BOX64_DYNAREC_BIGBLOCK=1
export BOX64_DYNAREC_FORWARD=256
export BOX64_DYNAREC_CALLRET=1
```

### Multiple Server Instances

To run multiple servers, duplicate the setup with different ports:

```yaml
services:
  soulmask-server-1:
    # ... configuration
    ports:
      - "7777:7777/udp"
      - "27015:27015/udp"
      
  soulmask-server-2:
    # ... configuration
    ports:
      - "7778:7777/udp"
      - "27016:27015/udp"
```

## Support

For issues related to:
- **Box64:** Check the [Box64 GitHub repository](https://github.com/ptitSeb/box64)
- **Soulmask:** Visit the official Soulmask community forums
- **Docker:** Consult Docker documentation

## License

This setup is provided as-is for educational and personal use. Soulmask is owned by CampFire Studio.