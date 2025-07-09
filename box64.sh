#!/bin/bash

# Box64 wrapper script for different ARM64 platforms
# This script detects the platform and uses the appropriate Box64 binary

# Function to detect ARM64 platform
detect_platform() {
    local cpu_info=$(cat /proc/cpuinfo)
    local hardware=$(cat /proc/device-tree/model 2>/dev/null || echo "unknown")
    
    # Check for Apple Silicon (M1/M2)
    if [[ "$cpu_info" == *"Apple"* ]] || [[ "$hardware" == *"Apple"* ]]; then
        echo "m1"
        return
    fi
    
    # Check for Raspberry Pi 5
    if [[ "$hardware" == *"Raspberry Pi 5"* ]]; then
        # Check page size to determine 4K vs 16K
        local page_size=$(getconf PAGESIZE)
        if [[ "$page_size" == "16384" ]]; then
            echo "rpi5-16k"
        else
            echo "rpi5"
        fi
        return
    fi
    
    # Check for Raspberry Pi 4
    if [[ "$hardware" == *"Raspberry Pi 4"* ]]; then
        echo "rpi4"
        return
    fi
    
    # Check for Raspberry Pi 3
    if [[ "$hardware" == *"Raspberry Pi 3"* ]]; then
        echo "rpi3"
        return
    fi
    
    # Check for RK3588
    if [[ "$cpu_info" == *"rk3588"* ]] || [[ "$hardware" == *"rk3588"* ]]; then
        echo "rk3588"
        return
    fi
    
    # Check for Adlink platform
    if [[ "$hardware" == *"Adlink"* ]]; then
        echo "adlink"
        return
    fi
    
    # Default to generic if no specific platform detected
    echo "generic"
}

# Get the platform
PLATFORM=$(detect_platform)

# Select the appropriate Box64 binary
case "$PLATFORM" in
    "m1")
        BOX64_BIN="/usr/local/bin/box64-m1"
        ;;
    "rpi5")
        BOX64_BIN="/usr/local/bin/box64-rpi5"
        ;;
    "rpi5-16k")
        BOX64_BIN="/usr/local/bin/box64-rpi5-16k"
        ;;
    "rpi4")
        BOX64_BIN="/usr/local/bin/box64-rpi4"
        ;;
    "rpi3")
        BOX64_BIN="/usr/local/bin/box64-rpi3"
        ;;
    "rk3588")
        BOX64_BIN="/usr/local/bin/box64-rk3588"
        ;;
    "adlink")
        BOX64_BIN="/usr/local/bin/box64-adlink"
        ;;
    *)
        BOX64_BIN="/usr/local/bin/box64-generic"
        ;;
esac

# Check if the selected binary exists
if [[ ! -f "$BOX64_BIN" ]]; then
    echo "Warning: Platform-specific Box64 binary not found: $BOX64_BIN"
    echo "Falling back to generic Box64 binary"
    BOX64_BIN="/usr/local/bin/box64-generic"
fi

# Check if fallback exists
if [[ ! -f "$BOX64_BIN" ]]; then
    echo "Error: No Box64 binary found!"
    exit 1
fi

# Set Box64 environment variables for optimal performance
export BOX64_NOBANNER=1
export BOX64_LOG=0
export BOX64_CRASHHANDLER=1

# Platform-specific optimizations
case "$PLATFORM" in
    "m1")
        export BOX64_DYNAREC_STRONGMEM=1
        export BOX64_DYNAREC_BIGBLOCK=1
        export BOX64_DYNAREC_FORWARD=512
        ;;
    "rpi5"|"rpi5-16k")
        export BOX64_DYNAREC_STRONGMEM=1
        export BOX64_DYNAREC_BIGBLOCK=1
        export BOX64_DYNAREC_FORWARD=256
        ;;
    "rpi4")
        export BOX64_DYNAREC_STRONGMEM=1
        export BOX64_DYNAREC_BIGBLOCK=0
        export BOX64_DYNAREC_FORWARD=128
        ;;
    "rk3588")
        export BOX64_DYNAREC_STRONGMEM=1
        export BOX64_DYNAREC_BIGBLOCK=1
        export BOX64_DYNAREC_FORWARD=256
        ;;
esac

# Execute the program with Box64
exec "$BOX64_BIN" "$@"