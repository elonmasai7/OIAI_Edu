# OIAI Edu Cross-Platform Installer

A comprehensive cross-platform installation system for Oterman's Institute AI Education Platform (OIAIEdu).

## Overview

This installer provides unified installation support for Linux, macOS, Windows, and iOS platforms. The system is designed to work with Unity-based applications and includes platform-specific optimizations and installation procedures.

## Supported Platforms

### Windows
- **Status**: Fully supported
- **Architecture**: x86_64
- **Requirements**: Windows 10+
- **Installation**: Automated installer with desktop shortcuts

### Linux
- **Status**: Template ready (requires Unity Linux build)
- **Distributions**: Debian/Ubuntu, Red Hat/CentOS/Fedora, Arch Linux
- **Installation**: System-wide installation with desktop integration
- **Packaging**: Supports .deb, .rpm, and AppImage formats

### macOS
- **Status**: Template ready (requires Unity macOS build)
- **Requirements**: macOS 10.12+
- **Installation**: .app bundle with standard macOS integration
- **Packaging**: .dmg disk images supported

### iOS
- **Status**: Documentation and build instructions
- **Requirements**: Unity iOS Build Support, Xcode, Apple Developer Account
- **Distribution**: App Store, TestFlight, or Ad-Hoc distribution

## Quick Start

### For Users

#### Windows
```batch
# Download and run the installer
install.bat
```

#### Linux/macOS
```bash
# Download and run the installer
chmod +x install.sh
./install.sh
```

### For Developers

#### Build All Platforms
```bash
# From the cross-platform-installer directory
chmod +x scripts/build-all-platforms.sh
./scripts/build-all-platforms.sh
```

#### Build Specific Platform
```bash
# Build only Windows
./scripts/build-all-platforms.sh --windows-only

# Build only Linux
./scripts/build-all-platforms.sh --linux-only

# Build only macOS
./scripts/build-all-platforms.sh --macos-only
```

## Directory Structure

```
cross-platform-installer/
├── linux/                 # Linux build and assets
│   ├── OIAIEdu           # Linux executable (placeholder)
│   └── OIAIEdu_Data/     # Unity data directory
├── macos/                 # macOS build and assets
│   ├── OIAIEdu           # macOS executable (placeholder)
│   └── OIAIEdu_Data/     # Unity data directory
├── windows/               # Windows build and assets
│   ├── OIAIEdu.exe       # Windows executable
│   └── OIAIEdu_Data/     # Unity data directory
├── ios/                   # iOS build documentation
│   └── README.md         # iOS build instructions
├── scripts/               # Build and installation scripts
│   ├── install.sh        # Linux/macOS installer
│   ├── install.bat       # Windows installer
│   └── build-all-platforms.sh  # Cross-platform builder
└── docs/                  # Documentation
    └── README.md         # This file
```

## Installation Details

### System Requirements

- **RAM**: 4GB minimum, 8GB recommended
- **Storage**: 2GB free space
- **Graphics**: OpenGL 3.2+ or DirectX 11+ (Windows)
- **Operating System**:
  - Windows 10 or later
  - Ubuntu 18.04+, CentOS 7+, or equivalent
  - macOS 10.12+

### Linux Installation

The Linux installer supports multiple package formats:

#### Debian/Ubuntu (.deb)
```bash
sudo dpkg -i oiaiedu.deb
sudo apt-get install -f  # Install dependencies
```

#### Red Hat/CentOS/Fedora (.rpm)
```bash
sudo rpm -i oiaiedu.rpm
# or
sudo dnf install oiaiedu.rpm
```

#### AppImage (Universal)
```bash
chmod +x OIAIEdu.AppImage
./OIAIEdu.AppImage
```

### macOS Installation

#### .dmg Installation
1. Download the .dmg file
2. Double-click to mount
3. Drag OIAIEdu.app to Applications folder

#### Manual Installation
```bash
# From the macOS build directory
cp -r OIAIEdu.app /Applications/
```

### Windows Installation

#### Automated Installer
1. Download `install.bat`
2. Run as administrator
3. Follow the installation wizard

#### Manual Installation
1. Extract the Windows build
2. Run `OIAIEdu.exe`
3. Optional: Create desktop shortcut

### iOS Installation

iOS installation requires App Store distribution:

1. **App Store**: Search for "OIAI Edu" in the App Store
2. **TestFlight**: Install via TestFlight beta link
3. **Development**: Connect device and install via Xcode

## Development Guide

### Prerequisites

- Unity 2021.3+ with platform build support
- For iOS: Xcode 13+, Apple Developer Account
- For Linux: Linux build target enabled in Unity
- For macOS: macOS build target enabled in Unity

### Building from Unity

#### Windows Build
1. Open Unity project
2. File → Build Settings
3. Select "PC, Mac & Linux Standalone"
4. Target Platform: Windows
5. Architecture: x86_64
6. Build

#### Linux Build
1. Switch Target Platform to Linux
2. Architecture: x86_64
3. Build

#### macOS Build
1. Switch Target Platform to macOS
2. Architecture: x86_64 (Intel) or Apple Silicon
3. Build

#### iOS Build
1. Install iOS Build Support in Unity Hub
2. Switch Target Platform to iOS
3. Configure Player Settings:
   - Bundle Identifier: com.otermansinstitute.oiaiedu
   - Version: 1.0.0
4. Build
5. Open in Xcode and archive

### Packaging

#### Linux Packages
```bash
# Create .deb package
dpkg-deb --build linux oiaiedu.deb

# Create .rpm package (using alien)
alien -r oiaiedu.deb

# Create AppImage
appimagetool linux OIAIEdu.AppImage
```

#### macOS Packages
```bash
# Create .dmg
hdiutil create -volname "OIAI Edu" -srcfolder OIAIEdu.app -ov OIAIEdu.dmg
```

#### Windows Packages
```batch
# Create installer (using NSIS or similar)
makensis installer.nsi
```

## Troubleshooting

### Common Issues

#### Linux: "Permission denied"
```bash
chmod +x install.sh
sudo ./install.sh
```

#### Linux: Missing dependencies
```bash
# Ubuntu/Debian
sudo apt-get install libgtk-3-0 libasound2 libxrandr2 libxss1 libgconf-2-4

# CentOS/RHEL
sudo yum install gtk3 alsa-lib libXrandr libXScrnSaver GConf2
```

#### macOS: "App is damaged"
- Right-click app → Open (bypass Gatekeeper)
- Or: `xattr -rd com.apple.quarantine /Applications/OIAIEdu.app`

#### Windows: "Missing DLLs"
- Install Visual C++ Redistributables
- Update DirectX
- Install .NET Framework

#### iOS: Build fails
- Ensure Xcode command line tools installed
- Check Apple Developer account
- Verify bundle identifier uniqueness

### Performance Optimization

#### Linux
- Use proprietary graphics drivers
- Enable Vulkan (if available)
- Set `vblank_mode=0` for NVIDIA

#### macOS
- Ensure latest macOS updates
- Use Metal graphics API
- Close unnecessary applications

#### Windows
- Update graphics drivers
- Use DirectX 11 or 12
- Disable fullscreen optimizations if needed

## Contributing

### Code Style
- Bash: Follow Google Shell Style Guide
- Batch: Clear comments and error handling
- Documentation: Markdown with consistent formatting

### Testing
- Test on target platforms before release
- Verify file permissions
- Test uninstallation procedures
- Validate dependencies

### Distribution
- Create checksums for all packages
- Sign packages where possible
- Provide clear installation instructions
- Include system requirements

## License

This installation system is provided under the same license as the OIAI Edu application.

## Support

For support and questions:
- Check the troubleshooting section
- Review platform-specific documentation
- Contact the development team

## Version History

- **v1.0.0**: Initial cross-platform installer release
  - Windows: Full support
  - Linux: Template and documentation
  - macOS: Template and documentation
  - iOS: Build instructions and documentation