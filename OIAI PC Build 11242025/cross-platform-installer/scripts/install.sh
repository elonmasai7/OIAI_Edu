#!/bin/bash

# OIAI Edu Cross-Platform Installer
# Supports Linux, macOS, and Windows installation

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Application information
APP_NAME="OIAIEdu"
APP_VERSION="1.0.0"
APP_DESCRIPTION="Oterman's Institute AI Education Platform"

# Installation directories
INSTALL_DIR=""
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Detect platform
detect_platform() {
    case "$(uname -s)" in
        Linux*)
            if [ -f /etc/debian_version ]; then
                PLATFORM="debian"
            elif [ -f /etc/redhat-release ]; then
                PLATFORM="redhat"
            elif [ -f /etc/arch-release ]; then
                PLATFORM="arch"
            else
                PLATFORM="linux"
            fi
            ;;
        Darwin*)
            PLATFORM="macos"
            ;;
        CYGWIN*|MINGW32*|MSYS*|MINGW*)
            PLATFORM="windows"
            ;;
        *)
            echo -e "${RED}Unsupported platform: $(uname -s)${NC}"
            exit 1
            ;;
    esac
}

# Check system requirements
check_requirements() {
    echo -e "${BLUE}Checking system requirements...${NC}"

    # Check available disk space (minimum 2GB)
    local required_space=2000000  # 2GB in KB
    local available_space=$(df "$HOME" | tail -1 | awk '{print $4}')

    if [ "$available_space" -lt "$required_space" ]; then
        echo -e "${RED}Error: Insufficient disk space. At least 2GB required.${NC}"
        exit 1
    fi

    # Check for required tools based on platform
    case "$PLATFORM" in
        debian)
            if ! command -v dpkg &> /dev/null; then
                echo -e "${RED}Error: dpkg not found. Please install dpkg.${NC}"
                exit 1
            fi
            ;;
        redhat)
            if ! command -v rpm &> /dev/null; then
                echo -e "${RED}Error: rpm not found. Please install rpm.${NC}"
                exit 1
            fi
            ;;
        macos)
            if ! command -v brew &> /dev/null && ! command -v port &> /dev/null; then
                echo -e "${YELLOW}Warning: Neither Homebrew nor MacPorts found. Some features may not work.${NC}"
            fi
            ;;
    esac

    echo -e "${GREEN}System requirements check passed.${NC}"
}

# Set installation directory
set_install_dir() {
    case "$PLATFORM" in
        debian|redhat|arch|linux)
            INSTALL_DIR="/opt/$APP_NAME"
            ;;
        macos)
            INSTALL_DIR="/Applications/$APP_NAME.app"
            ;;
        windows)
            INSTALL_DIR="$HOME/AppData/Local/$APP_NAME"
            ;;
    esac

    echo -e "${BLUE}Installation directory: $INSTALL_DIR${NC}"
}

# Create desktop entry for Linux
create_desktop_entry() {
    if [[ "$PLATFORM" =~ ^(debian|redhat|arch|linux)$ ]]; then
        local desktop_file="/usr/share/applications/$APP_NAME.desktop"

        echo -e "${BLUE}Creating desktop entry...${NC}"

        sudo tee "$desktop_file" > /dev/null << EOF
[Desktop Entry]
Name=$APP_NAME
Comment=$APP_DESCRIPTION
Exec=$INSTALL_DIR/$APP_NAME
Icon=$INSTALL_DIR/icon.png
Terminal=false
Type=Application
Categories=Education;Science;
StartupWMClass=$APP_NAME
EOF

        sudo chmod +x "$desktop_file"
        echo -e "${GREEN}Desktop entry created.${NC}"
    fi
}

# Install for Linux
install_linux() {
    echo -e "${BLUE}Installing $APP_NAME for Linux...${NC}"

    # Create installation directory
    sudo mkdir -p "$INSTALL_DIR"

    # Copy application files
    sudo cp -r "$SOURCE_DIR/linux/"* "$INSTALL_DIR/"

    # Make executable
    sudo chmod +x "$INSTALL_DIR/$APP_NAME"

    # Create desktop entry
    create_desktop_entry

    echo -e "${GREEN}Linux installation completed.${NC}"
}

# Install for macOS
install_macos() {
    echo -e "${BLUE}Installing $APP_NAME for macOS...${NC}"

    # Create application bundle
    mkdir -p "$INSTALL_DIR/Contents/MacOS"
    mkdir -p "$INSTALL_DIR/Contents/Resources"

    # Copy application files
    cp -r "$SOURCE_DIR/macos/"* "$INSTALL_DIR/Contents/MacOS/"

    # Create Info.plist
    cat > "$INSTALL_DIR/Contents/Info.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>$APP_NAME</string>
    <key>CFBundleIdentifier</key>
    <string>com.otermansinstitute.$APP_NAME</string>
    <key>CFBundleName</key>
    <string>$APP_NAME</string>
    <key>CFBundleVersion</key>
    <string>$APP_VERSION</string>
    <key>CFBundleShortVersionString</key>
    <string>$APP_VERSION</string>
    <key>CFBundleIconFile</key>
    <string>icon.icns</string>
    <key>LSMinimumSystemVersion</key>
    <string>10.12</string>
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
EOF

    # Make executable
    chmod +x "$INSTALL_DIR/Contents/MacOS/$APP_NAME"

    echo -e "${GREEN}macOS installation completed.${NC}"
}

# Install for Windows (using Cygwin/MSYS2 or similar)
install_windows() {
    echo -e "${BLUE}Installing $APP_NAME for Windows...${NC}"

    # Create installation directory
    mkdir -p "$INSTALL_DIR"

    # Copy application files
    cp -r "$SOURCE_DIR/windows/"* "$INSTALL_DIR/"

    # Create start menu shortcut (if possible)
    local start_menu_dir="$HOME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs"
    if [ -d "$start_menu_dir" ]; then
        cp "$SOURCE_DIR/windows/$APP_NAME.lnk" "$start_menu_dir/" 2>/dev/null || true
    fi

    echo -e "${GREEN}Windows installation completed.${NC}"
}

# Install iOS version (placeholder - requires iOS build)
install_ios() {
    echo -e "${YELLOW}iOS installation requires iOS App Store or TestFlight distribution.${NC}"
    echo -e "${YELLOW}Please ensure the iOS build is available in the App Store.${NC}"

    # This would typically involve:
    # 1. Having the .ipa file
    # 2. Using tools like ios-deploy or libimobiledevice
    # 3. Or directing users to the App Store

    echo -e "${BLUE}For iOS installation:${NC}"
    echo "1. Build the iOS version using Unity with iOS build support"
    echo "2. Archive and distribute through TestFlight or App Store"
    echo "3. Users can install directly from their iOS devices"
}

# Main installation function
main() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  $APP_NAME Installer${NC}"
    echo -e "${BLUE}  Version: $APP_VERSION${NC}"
    echo -e "${BLUE}================================${NC}"
    echo

    detect_platform
    echo -e "${GREEN}Detected platform: $PLATFORM${NC}"

    check_requirements
    set_install_dir

    # Confirm installation
    echo -e "${YELLOW}This will install $APP_NAME to: $INSTALL_DIR${NC}"
    read -p "Continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Installation cancelled.${NC}"
        exit 0
    fi

    # Perform installation based on platform
    case "$PLATFORM" in
        debian|redhat|arch|linux)
            install_linux
            ;;
        macos)
            install_macos
            ;;
        windows)
            install_windows
            ;;
    esac

    # iOS installation note
    if [[ "$PLATFORM" == "macos" ]]; then
        echo
        install_ios
    fi

    echo
    echo -e "${GREEN}Installation completed successfully!${NC}"
    echo -e "${BLUE}You can now run $APP_NAME from your applications menu or by executing:${NC}"
    echo -e "${BLUE}  $INSTALL_DIR/$APP_NAME${NC}"
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        echo "Usage: $0 [OPTIONS]"
        echo
        echo "Cross-platform installer for $APP_NAME"
        echo
        echo "Options:"
        echo "  --help, -h          Show this help message"
        echo "  --version, -v       Show version information"
        echo "  --uninstall         Uninstall the application"
        echo
        echo "Supported platforms:"
        echo "  - Linux (Debian/Ubuntu, Red Hat/CentOS/Fedora, Arch Linux)"
        echo "  - macOS"
        echo "  - Windows (via Cygwin/MSYS2)"
        exit 0
        ;;
    --version|-v)
        echo "$APP_NAME Installer $APP_VERSION"
        exit 0
        ;;
    --uninstall)
        echo -e "${YELLOW}Uninstall functionality not yet implemented.${NC}"
        exit 1
        ;;
    *)
        main
        ;;
esac