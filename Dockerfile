FROM arm64v8/debian:bookworm-slim as box64_m1

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
 	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
  		wget \
		gnupg \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
	&& (wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg) \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		box64-m1

############################################################

FROM arm64v8/debian:bookworm-slim as box64_rpi5_4k

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
 	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
  		wget \
		gnupg \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
	&& (wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg) \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		box64-rpi5arm64

############################################################

FROM arm64v8/debian:bookworm-slim as box64_rpi5_16k

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		wget \
		gnupg \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
	&& (wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg) \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		box64-rpi5arm64ps16k

############################################################

FROM arm64v8/debian:bookworm-slim as box64_rpi4

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		wget \
		gnupg \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
	&& (wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg) \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		box64-rpi4arm64

############################################################

FROM arm64v8/debian:bookworm-slim as box64_rpi4_0.2.7

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		wget \
		gnupg \
	&& wget --progress=dot:giga https://github.com/Pi-Apps-Coders/box64-debs/raw/064eb3cffe90fa40d5ab44325a90720c28aaae2b/debian/box64-rpi4arm64_0.2.7+20240521T063129.3882a98-1_arm64.deb -O ./box64-0.2.7.deb \
	&& dpkg -i ./box64-0.2.7.deb

############################################################

FROM arm64v8/debian:bookworm-slim as box64_rpi3

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		wget \
		gnupg \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
	&& (wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg) \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		box64-rpi3arm64

############################################################

FROM arm64v8/debian:bookworm-slim as box64_rk3588

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		wget \
		gnupg \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
	&& (wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg) \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		box64-rk3588

############################################################

FROM arm64v8/python:slim-bookworm as box64_adlink

ENV DEBIAN_FRONTEND noninteractive

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		git \
		ca-certificates \
		build-essential \
		cmake \
		mold \
	&& git clone https://github.com/ptitSeb/box64.git \
	&& mkdir /box64/build \
	&& cd /box64/build \
	&& cmake .. -D ADLINK=1 -D CMAKE_BUILD_TYPE=RelWithDebInfo -D WITH_MOLD=1 \
	&& mold -run make -j$(nproc) \
	&& make install DESTDIR=/tmp/install

############################################################
# Dockerfile that contains SteamCMD, Box86/64, and Soulmask
############################################################

FROM arm64v8/debian:bookworm-slim as build_stage

LABEL maintainer="github@snry.me"
ARG PUID=1000

ENV USER steam
ENV HOMEDIR "/home/${USER}"
ENV STEAMCMDDIR "${HOMEDIR}/steamcmd"
ENV SOULMASKDIR "${HOMEDIR}/soulmask"

ENV DEBIAN_FRONTEND noninteractive

ENV DEBUGGER "/usr/local/bin/box86"

ENV LD_LIBRARY_PATH "${LD_LIBRARY_PATH}:/usr/lib/box64-x86_64-linux-gnu"

# Set SHELL option explicitly
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY --from=box64_m1 /usr/local/bin/box64 /usr/local/bin/box64-m1
COPY --from=box64_rpi5_4k /usr/local/bin/box64 /usr/local/bin/box64-rpi5
COPY --from=box64_rpi5_16k /usr/local/bin/box64 /usr/local/bin/box64-rpi5-16k
COPY --from=box64_rpi4 /usr/local/bin/box64 /usr/local/bin/box64-rpi4
COPY --from=box64_rpi4_0.2.7 /usr/local/bin/box64 /usr/local/bin/box64-rpi4-0_2_7
COPY --from=box64_rpi3 /usr/local/bin/box64 /usr/local/bin/box64-rpi3
COPY --from=box64_rk3588 /usr/local/bin/box64 /usr/local/bin/box64-rk3588
COPY --from=box64_adlink /tmp/install/usr/local/bin/box64 /usr/local/bin/box64-adlink

# hadolint ignore=DL3008
RUN set -x \
	# Install, update & upgrade packages
	&& dpkg --add-architecture armhf \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
 	&& apt-get install -y --no-install-recommends --no-install-suggests \
		libc6:i386 \
		libc6:armhf \
		libstdc++6:i386 \
		libstdc++6:armhf \
		libcurl4 \
		libcurl4:i386 \
		libnuma1 \
		libnuma1:i386 \
		libglib2.0-0 \
		libglib2.0-0:i386 \
		openssl \
		ca-certificates \
		nano \
		curl \
		locales \
  		wget \
		gnupg \
		screen \
		supervisor \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
	&& (wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg) \
	&& wget --progress=dot:giga https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list \
	&& (wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg) \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		box64 \
	&& apt-get download -y \
		box86-generic-arm \
	&& dpkg-deb -R *.deb box86_tmp \
	&& rm -rf box86_tmp/usr/lib/i386-linux-gnu/libstdc++.so* \
	&& dpkg-deb -b box86_tmp new_box86.deb \
	&& dpkg -i new_box86.deb \
	&& rm -rf *.deb \
	&& rm -rf box86_tmp \
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& dpkg-reconfigure --frontend=noninteractive locales \
	# Create unprivileged user
	&& useradd -l -u "${PUID}" -m "${USER}" \
        # Download SteamCMD, execute as user
        && su "${USER}" -c \
		"mkdir -p \"${STEAMCMDDIR}\" \
                && curl -fsSL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar xvzf - -C \"${STEAMCMDDIR}\" \
                && ${STEAMCMDDIR}/steamcmd.sh +quit \
                && ln -s \"${STEAMCMDDIR}/linux32/steamclient.so\" \"${STEAMCMDDIR}/steamservice.so\" \
                && mkdir -p \"${HOMEDIR}/.steam/sdk32\" \
                && ln -s \"${STEAMCMDDIR}/linux32/steamclient.so\" \"${HOMEDIR}/.steam/sdk32/steamclient.so\" \
                && ln -s \"${STEAMCMDDIR}/linux32/steamcmd\" \"${STEAMCMDDIR}/linux32/steam\" \
                && mkdir -p \"${HOMEDIR}/.steam/sdk64\" \
                && ln -s \"${STEAMCMDDIR}/linux64/steamclient.so\" \"${HOMEDIR}/.steam/sdk64/steamclient.so\" \
                && ln -s \"${STEAMCMDDIR}/linux64/steamcmd\" \"${STEAMCMDDIR}/linux64/steam\" \
                && ln -s \"${STEAMCMDDIR}/steamcmd.sh\" \"${STEAMCMDDIR}/steam.sh\"" \
	# Download Soulmask Dedicated Server
	&& su "${USER}" -c \
		"mkdir -p \"${SOULMASKDIR}\" \
		&& ${STEAMCMDDIR}/steamcmd.sh +force_install_dir \"${SOULMASKDIR}\" +login anonymous +app_update 3017310 validate +quit" \
	# Symlink steamclient.so; So misconfigured dedicated servers can find it
	&& mkdir -p /usr/lib/x86_64-linux-gnu \
 	&& ln -s "${STEAMCMDDIR}/linux64/steamclient.so" "/usr/lib/x86_64-linux-gnu/steamclient.so" \
 	&& ln -s "${STEAMCMDDIR}/linux32/steamclient.so" "/usr/lib/i386-linux-gnu/steamclient.so" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mv /usr/local/bin/box64 /usr/local/bin/box64-generic \
	&& (for file in /usr/lib/box64-x86_64-linux-gnu/*; do [ -e "/usr/lib/x86_64-linux-gnu/$(basename "$file")" ] || ln -s "$file" /usr/lib/x86_64-linux-gnu/; done)

# Copy Box64 wrapper script
COPY box64.sh /usr/local/bin/box64
RUN chmod +x /usr/local/bin/box64

# Create Soulmask server configuration and startup scripts
RUN mkdir -p "${SOULMASKDIR}/WS/Saved/Config/LinuxServer" \
	&& mkdir -p "${SOULMASKDIR}/WS/Saved/Logs" \
	&& chown -R "${USER}:${USER}" "${SOULMASKDIR}"

# Create default Game.ini configuration
RUN su "${USER}" -c "cat > \"${SOULMASKDIR}/WS/Saved/Config/LinuxServer/Game.ini\" << 'EOF'
[/Script/SoulMask.SMGameMode]
EnablePVP=false
PVPDamageModifier=1.0
PVPStructureDamageModifier=1.0
EnablePVPStructureDamage=false
MaxSaveFileBackups=10
SaveBackupInterval=3600
AllowDestructibleBuilding=true
PreventBuildingNearSpawn=false
EnableLootDrop=true
LootDecayTimer=3600
AllowTribeMerging=true
EnableTributeSystem=true
EnableChatSpam=false
ServerPassword=
ServerName=Soulmask Dedicated Server
ServerDescription=A Soulmask dedicated server running on ARM64 with Box64
MaxPlayers=20
ServerPort=7777
QueryPort=27015
RCONPort=27020
RCONPassword=
GameDifficulty=1
EOF"

# Create default Engine.ini configuration
RUN su "${USER}" -c "cat > \"${SOULMASKDIR}/WS/Saved/Config/LinuxServer/Engine.ini\" << 'EOF'
[URL]
Port=7777

[OnlineSubsystemSteam]
bEnabled=true
SteamDevAppId=2646460
bInitServerOnClient=true

[/Script/OnlineSubsystemSteam.SteamNetDriver]
NetConnectionClassName=OnlineSubsystemSteam.SteamNetConnection

[Core.Log]
LogStreaming=VeryVerbose
LogWorld=VeryVerbose
EOF"

# Create server startup script
RUN cat > "${SOULMASKDIR}/start_server.sh" << 'EOF'
#!/bin/bash
cd /home/steam/soulmask
export LD_LIBRARY_PATH="/usr/lib/box64-x86_64-linux-gnu:$LD_LIBRARY_PATH"
exec box64 WS/Binaries/Linux/WSServer-Linux-Shipping &
EOF

# Create server update script
RUN cat > "${SOULMASKDIR}/update_server.sh" << 'EOF'
#!/bin/bash
cd /home/steam/steamcmd
./steamcmd.sh +force_install_dir "/home/steam/soulmask" +login anonymous +app_update 3017310 validate +quit
EOF

# Make scripts executable
RUN chmod +x "${SOULMASKDIR}/start_server.sh" "${SOULMASKDIR}/update_server.sh" \
	&& chown "${USER}:${USER}" "${SOULMASKDIR}/start_server.sh" "${SOULMASKDIR}/update_server.sh"

# Create supervisor configuration for Soulmask
RUN mkdir -p /etc/supervisor/conf.d
RUN cat > /etc/supervisor/conf.d/soulmask.conf << 'EOF'
[program:soulmask]
command=/home/steam/soulmask/start_server.sh
directory=/home/steam/soulmask
user=steam
autostart=false
autorestart=true
stderr_logfile=/var/log/soulmask.err.log
stdout_logfile=/var/log/soulmask.out.log
EOF

# Expose ports
# 7777 - Game port
# 27015 - Query port
# 27020 - RCON port
EXPOSE 7777/udp 27015/udp 27020/tcp

FROM build_stage AS bookworm-root
WORKDIR ${STEAMCMDDIR}

# Add entrypoint script
RUN cat > /entrypoint.sh << 'EOF'
#!/bin/bash
echo "Starting Soulmask Dedicated Server..."
echo "Available commands:"
echo "  start-soulmask    - Start the Soulmask server"
echo "  update-soulmask   - Update the Soulmask server"
echo "  steamcmd          - Run SteamCMD"
echo "  bash              - Start bash shell"
echo ""

case "$1" in
    start-soulmask)
        echo "Starting Soulmask server..."
        supervisord -c /etc/supervisor/supervisord.conf &
        supervisorctl start soulmask
        tail -f /var/log/soulmask.out.log
        ;;
    update-soulmask)
        echo "Updating Soulmask server..."
        su steam -c "/home/steam/soulmask/update_server.sh"
        ;;
    steamcmd)
        shift
        su steam -c "cd /home/steam/steamcmd && ./steamcmd.sh $*"
        ;;
    bash)
        /bin/bash
        ;;
    *)
        echo "Usage: $0 {start-soulmask|update-soulmask|steamcmd|bash}"
        echo "Starting bash shell by default..."
        /bin/bash
        ;;
esac
EOF

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start-soulmask"]

FROM bookworm-root AS bookworm
# Switch to user
USER ${USER}