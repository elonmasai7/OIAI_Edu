#!/bin/bash

# OIAI Edu Cross-Platform Build Script
# Prepares builds for Linux, macOS, Windows, and iOS

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

# Directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_BUILD_DIR="$BASE_DIR/../OIAI PC Build 11 24 2025 Fully Compressed Graphics"
LINUX_DIR="$BASE_DIR/linux"
MACOS_DIR="$BASE_DIR/macos"
WINDOWS_DIR="$BASE_DIR/windows"

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if source build exists
check_source_build() {
    if [ ! -d "$SOURCE_BUILD_DIR" ]; then
        log_error "Source build directory not found: $SOURCE_BUILD_DIR"
        log_error "Please ensure the Unity Windows build is available."
        exit 1
    fi

    if [ ! -f "$SOURCE_BUILD_DIR/$APP_NAME.exe" ]; then
        log_error "Main executable not found: $SOURCE_BUILD_DIR/$APP_NAME.exe"
        exit 1
    fi

    log_success "Source build found and validated."
}

# Prepare Windows build
prepare_windows_build() {
    log_info "Preparing Windows build..."

    mkdir -p "$WINDOWS_DIR"

    # Copy all Windows-specific files
    cp -r "$SOURCE_BUILD_DIR/"* "$WINDOWS_DIR/"

    # Create version info
    cat > "$WINDOWS_DIR/version.txt" << EOF
Application: $APP_NAME
Version: $APP_VERSION
Platform: Windows
Build Date: $(date)
Architecture: x86_64
EOF

    # Create a simple launcher script for Windows
    cat > "$WINDOWS_DIR/run.bat" << EOF
@echo off
echo Starting $APP_NAME...
start "" "$APP_NAME.exe"
EOF

    log_success "Windows build prepared."
}

# Prepare Linux build
prepare_linux_build() {
    log_info "Preparing Linux build..."

    mkdir -p "$LINUX_DIR"

    # Copy core application files (Unity data)
    cp -r "$SOURCE_BUILD_DIR/OIAIEdu_Data" "$LINUX_DIR/"

    # Create a Linux executable script (placeholder for actual Linux build)
    cat > "$LINUX_DIR/$APP_NAME" << 'EOF'
#!/bin/bash

# OIAI Edu Linux Launcher
# This is a placeholder for the actual Linux build
# In a real scenario, this would be the Linux executable from Unity

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_NAME="OIAIEdu"

echo "======================================="
echo "  $APP_NAME - Linux Edition"
echo "======================================="
echo
echo "This is a placeholder for the Linux build."
echo "To create a proper Linux build:"
echo "1. Open the Unity project"
echo "2. Switch build target to Linux"
echo "3. Build the application"
echo "4. Replace this script with the actual executable"
echo
echo "Application data is available in: $APP_DIR/OIAIEdu_Data"
echo
read -p "Press Enter to exit..."
EOF

    chmod +x "$LINUX_DIR/$APP_NAME"

    # Create version info
    cat > "$LINUX_DIR/version.txt" << EOF
Application: $APP_NAME
Version: $APP_VERSION
Platform: Linux
Build Date: $(date)
Architecture: x86_64
Note: This is a template build. Replace with actual Unity Linux build.
EOF

    log_success "Linux build template prepared."
}

# Prepare macOS build
prepare_macos_build() {
    log_info "Preparing macOS build..."

    mkdir -p "$MACOS_DIR"

    # Copy core application files
    cp -r "$SOURCE_BUILD_DIR/OIAIEdu_Data" "$MACOS_DIR/"

    # Create a macOS app structure (placeholder)
    cat > "$MACOS_DIR/$APP_NAME" << 'EOF'
#!/bin/bash

# OIAI Edu macOS Launcher
# This is a placeholder for the actual macOS build
# In a real scenario, this would be inside a .app bundle

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_NAME="OIAIEdu"

echo "======================================="
echo "  $APP_NAME - macOS Edition"
echo "======================================="
echo
echo "This is a placeholder for the macOS build."
echo "To create a proper macOS build:"
echo "1. Open the Unity project"
echo "2. Switch build target to macOS"
echo "3. Build the application"
echo "4. Create proper .app bundle structure"
echo
echo "Application data is available in: $APP_DIR/OIAIEdu_Data"
echo
read -p "Press Enter to exit..."
EOF

    chmod +x "$MACOS_DIR/$APP_NAME"

    # Create version info
    cat > "$MACOS_DIR/version.txt" << EOF
Application: $APP_NAME
Version: $APP_VERSION
Platform: macOS
Build Date: $(date)
Architecture: x86_64
Note: This is a template build. Replace with actual Unity macOS build.
EOF

    log_success "macOS build template prepared."
}

# Prepare iOS build notes
prepare_ios_build() {
    log_info "Preparing iOS build documentation..."

    mkdir -p "$BASE_DIR/ios"

    # Create iOS build instructions
    cat > "$BASE_DIR/ios/README.md" << 'EOF'
# OIAI Edu - iOS Build Instructions

## Prerequisites

1. **Unity iOS Build Support**: Install iOS build support in Unity Hub
2. **Xcode**: Install Xcode from Mac App Store
3. **Apple Developer Account**: Required for code signing and distribution

## Build Steps

### 1. Unity Project Setup
1. Open the Unity project
2. Go to File → Build Settings
3. Select "iOS" as the target platform
4. Click "Switch Platform"

### 2. Configure Player Settings
1. Go to Edit → Project Settings → Player
2. Configure the following:
   - Company Name: Oterman's Institute
   - Product Name: OIAIEdu
   - Version: 1.0.0
   - Bundle Identifier: com.otermansinstitute.oiaiedu

### 3. Build for iOS
1. In Build Settings, click "Build"
2. Choose a folder for the Xcode project
3. Unity will generate an Xcode project

### 4. Xcode Configuration
1. Open the generated Xcode project
2. Configure code signing:
   - Select your development team
   - Choose appropriate provisioning profile
3. Set deployment target (iOS 12.0+ recommended)
4. Build and archive the project

### 5. Distribution Options

#### TestFlight (Beta Testing)
1. Archive the build in Xcode
2. Upload to App Store Connect
3. Configure TestFlight testing
4. Invite testers

#### App Store (Production)
1. Archive the build in Xcode
2. Upload to App Store Connect
3. Configure app metadata
4. Submit for review

#### Ad-Hoc/Sideloading
1. Create Ad-Hoc provisioning profile
2. Build IPA file
3. Distribute IPA to registered devices

## iOS-Specific Features

- **Touch Controls**: Adapt UI for touch interaction
- **Performance**: Optimize for mobile hardware
- **Storage**: Handle iOS file system restrictions
- **Network**: Configure for cellular data usage

## Troubleshooting

- **Code Signing Issues**: Ensure proper developer certificates
- **Provisioning Profile**: Match bundle ID and device UDIDs
- **Unity iOS Support**: Verify Unity version compatibility

## Required Assets

- App Icons (various sizes)
- Launch Screen images
- Screenshots for App Store
- Privacy policy for App Store submission
EOF

    # Create version info
    cat > "$BASE_DIR/ios/version.txt" << EOF
Application: $APP_NAME
Version: $APP_VERSION
Platform: iOS
Build Date: $(date)
Note: iOS builds require Unity iOS build support and Xcode
EOF

    log_success "iOS build documentation prepared."
}

# Create distribution packages
create_packages() {
    log_info "Creating distribution packages..."

    # Create Linux AppImage (placeholder)
    if command -v appimagetool &> /dev/null; then
        log_info "Creating AppImage package..."
        # This would create an AppImage, but requires actual Linux executable
        log_warning "AppImage creation skipped - requires actual Linux build"
    fi

    # Create macOS .dmg (placeholder)
    if command -v hdiutil &> /dev/null; then
        log_info "Creating macOS .dmg package..."
        # This would create a .dmg, but requires actual macOS .app bundle
        log_warning ".dmg creation skipped - requires actual macOS build"
    fi

    log_success "Package creation completed (placeholders created)."
}

# Create build summary
create_build_summary() {
    log_info "Creating build summary..."

    cat > "$BASE_DIR/build-summary.txt" << EOF
OIAI Edu Cross-Platform Build Summary
=====================================

Build Date: $(date)
Version: $APP_VERSION

Platforms Prepared:
==================

Windows:
- Location: $WINDOWS_DIR
- Executable: $APP_NAME.exe
- Status: Complete (from source build)

Linux:
- Location: $LINUX_DIR
- Executable: $APP_NAME (script placeholder)
- Status: Template (requires Unity Linux build)

macOS:
- Location: $MACOS_DIR
- Executable: $APP_NAME (script placeholder)
- Status: Template (requires Unity macOS build)

iOS:
- Location: $BASE_DIR/ios
- Documentation: iOS build instructions
- Status: Documentation only (requires Unity iOS build support)

Next Steps:
===========

1. For Linux builds:
   - Open Unity project
   - Switch platform to Linux
   - Build and replace the placeholder script

2. For macOS builds:
   - Open Unity project
   - Switch platform to macOS
   - Build and create proper .app bundle

3. For iOS builds:
   - Install Unity iOS build support
   - Configure Xcode and developer account
   - Follow iOS build instructions in ios/README.md

4. Test installations:
   - Run install.sh on Linux/macOS
   - Run install.bat on Windows

Distribution:
=============

- Windows: Ready for distribution
- Linux: Requires actual build
- macOS: Requires actual build
- iOS: Requires App Store/TestFlight distribution
EOF

    log_success "Build summary created: $BASE_DIR/build-summary.txt"
}

# Main build function
main() {
    echo -e "${BLUE}======================================${NC}"
    echo -e "${BLUE}  $APP_NAME Cross-Platform Builder${NC}"
    echo -e "${BLUE}  Version: $APP_VERSION${NC}"
    echo -e "${BLUE}======================================${NC}"
    echo

    log_info "Starting cross-platform build process..."

    check_source_build
    prepare_windows_build
    prepare_linux_build
    prepare_macos_build
    prepare_ios_build
    create_packages
    create_build_summary

    echo
    log_success "Cross-platform build preparation completed!"
    echo -e "${BLUE}See build-summary.txt for detailed information.${NC}"
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        echo "Usage: $0 [OPTIONS]"
        echo
        echo "Cross-platform build script for $APP_NAME"
        echo
        echo "Options:"
        echo "  --help, -h          Show this help message"
        echo "  --clean              Clean build directories"
        echo "  --windows-only       Build Windows only"
        echo "  --linux-only         Build Linux only"
        echo "  --macos-only         Build macOS only"
        echo
        exit 0
        ;;
    --clean)
        echo "Cleaning build directories..."
        rm -rf "$LINUX_DIR" "$MACOS_DIR" "$WINDOWS_DIR" "$BASE_DIR/ios"
        echo "Build directories cleaned."
        exit 0
        ;;
    --windows-only)
        check_source_build
        prepare_windows_build
        echo "Windows build completed."
        exit 0
        ;;
    --linux-only)
        prepare_linux_build
        echo "Linux build template created."
        exit 0
        ;;
    --macos-only)
        prepare_macos_build
        echo "macOS build template created."
        exit 0
        ;;
    *)
        main
        ;;
esac