# 🎓 OIAI Edu - Cross-Platform Educational Platform

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Cross--Platform-green.svg)](https://github.com/elonmasai7/OIAI_Edu)
[![Unity](https://img.shields.io/badge/Unity-2021.3+-black.svg)](https://unity.com/)

> **Oterman's Institute AI Education Platform** - Revolutionizing education through AI-powered learning experiences across all major platforms.

![OIAI Edu Banner](https://via.placeholder.com/1200x300/4F46E5/FFFFFF?text=OIAI+Edu+-+AI+Powered+Education)

## 📋 Table of Contents

- [🌟 Features](#-features)
- [📥 Download & Install](#-download--install)
  - [🪟 Windows](#-windows)
  - [🐧 Linux](#-linux)
  - [🍎 macOS](#-macos)
  - [📱 iOS](#-ios)
- [🖥️ System Requirements](#️-system-requirements)
- [🚀 Quick Start Guide](#-quick-start-guide)
- [🔧 Troubleshooting](#-troubleshooting)
- [📞 Support & Contact](#-support--contact)

## 🌟 Features

- **🤖 AI-Powered Learning**: Advanced AI algorithms adapt to individual learning styles
- **🎯 Personalized Curriculum**: Custom learning paths based on student progress and goals
- **📊 Real-time Analytics**: Comprehensive tracking of learning outcomes and engagement
- **🎮 Interactive Experiences**: Immersive 3D environments and gamified learning modules
- **🌐 Multi-Platform Support**: Seamless experience across Windows, Linux, macOS, and iOS
- **🔒 Secure & Private**: Enterprise-grade security with data protection compliance

## 📥 Download & Install

Navigate to the [OIAI PC Build 11242025](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025) folder in this repository to access all platform builds. Follow the platform-specific instructions below.

### 🪟 Windows

**Compatible with Windows 10/11**

#### Option 1: Automated Installation (Recommended)
1. Go to [OIAI PC Build 11242025/cross-platform-installer/windows/](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/cross-platform-installer/windows)
2. Download all files in this folder (or download the entire repository as ZIP)
3. Extract the files to a folder on your computer
4. Run `install.bat` as administrator
5. Follow the on-screen installation prompts

#### Option 2: Manual Installation
1. Download `OIAIEdu.exe` and `UnityPlayer.dll` from the [windows folder](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/cross-platform-installer/windows)
2. Download the `OIAIEdu_Data` folder (contains all game assets)
3. Place all files in the same directory
4. Double-click `OIAIEdu.exe` to run

#### Option 3: Full Build Package
For the complete experience with compressed graphics:
1. Go to [OIAI PC Build 11242025/OIAI PC Build 11 24 2025 Fully Compressed Graphics/](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/OIAI%20PC%20Build%2011%2024%202025%20Fully%20Compressed%20Graphics)
2. Download all files
3. Extract and run `OIAIEdu.exe`

### 🐧 Linux

**Compatible with Ubuntu, Debian, CentOS, RHEL, Arch Linux**

#### Automated Installation
1. Go to [OIAI PC Build 11242025/cross-platform-installer/linux/](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/cross-platform-installer/linux)
2. Download all files in the folder
3. Extract to a directory
4. Open terminal in the extracted directory
5. Run: `chmod +x scripts/install.sh && ./scripts/install.sh`
6. Follow the installation prompts

#### Manual Installation
1. Download `OIAIEdu` (executable) and `OIAIEdu_Data` folder from the [linux folder](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/cross-platform-installer/linux)
2. Make the executable runnable: `chmod +x OIAIEdu`
3. Run: `./OIAIEdu`

**Note**: Linux builds are currently in template form. For the latest stable version, use the Windows build with compatibility layers if needed.

### 🍎 macOS

**Compatible with macOS Monterey (12.0) and later**

#### Automated Installation
1. Go to [OIAI PC Build 11242025/cross-platform-installer/macos/](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/cross-platform-installer/macos)
2. Download all files
3. Extract the archive
4. Run: `chmod +x scripts/install.sh && ./scripts/install.sh`
5. The installer will create a proper .app bundle in your Applications folder

#### Manual Installation
1. Download `OIAIEdu` and `OIAIEdu_Data` folder from the [macos folder](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/cross-platform-installer/macos)
2. Make executable: `chmod +x OIAIEdu`
3. Run: `./OIAIEdu`

**Note**: macOS builds are currently in template form. For the latest stable version, consider the Windows build or check for future releases.

### 📱 iOS

**Compatible with iOS 12.0 and later**

iOS builds require App Store distribution. Currently available as documentation:

1. Visit [OIAI PC Build 11242025/cross-platform-installer/ios/](https://github.com/elonmasai7/OIAI_Edu/tree/main/OIAI%20PC%20Build%2011242025/cross-platform-installer/ios)
2. Read the iOS build documentation
3. For actual app installation, check the App Store for "OIAI Edu" or join TestFlight beta testing when available

**Future Release**: iOS app will be available through:
- [📱 App Store](https://apps.apple.com/app/oiaiedu)
- [🧪 TestFlight](https://testflight.apple.com/join/oiaiedu)

## 🖥️ System Requirements

### Minimum Requirements (All Platforms)
- **RAM**: 4GB
- **Storage**: 2GB free space
- **Graphics**: OpenGL 3.2+ or DirectX 11+
- **Network**: Broadband internet connection for online features

### Recommended Specifications
- **RAM**: 8GB or higher
- **Storage**: 5GB SSD space
- **Graphics**: Dedicated GPU with 2GB VRAM
- **Display**: 1920x1080 resolution
- **Network**: High-speed internet (25+ Mbps)

### Platform-Specific Requirements

#### Windows
- Windows 10 version 1903 or later
- .NET Framework 4.8 or later
- Visual C++ Redistributables (usually included)

#### Linux
- Ubuntu 18.04+, CentOS 7+, or equivalent
- GTK+ 3.0 libraries
- ALSA audio libraries
- X11 or Wayland display server

#### macOS
- macOS Monterey (12.0) or later
- Metal graphics API support
- 4GB RAM minimum

#### iOS
- iOS 12.0 or later
- iPhone 6s or newer / iPad 5th gen or newer
- 2GB free storage space

## 🚀 Quick Start Guide

1. **Choose Your Platform**: Select the appropriate download link above
2. **Download Files**: Use the GitHub folder navigation or download as ZIP
3. **Extract**: Unzip the downloaded files to a folder
4. **Install**: Run the installer script (.bat for Windows, .sh for Linux/macOS)
5. **Launch**: Double-click the executable or use the desktop shortcut
6. **First Time Setup**: Follow the in-app setup wizard
7. **Start Learning**: Begin with the tutorial or jump into courses

## 🔧 Troubleshooting

### Common Issues

#### Application Won't Start
- **Windows**: Ensure Visual C++ Redistributables are installed
- **Linux**: Check graphics drivers and OpenGL support
- **macOS**: Verify Metal graphics compatibility
- **All Platforms**: Ensure 4GB+ RAM and adequate disk space

#### Installation Fails
- Run installer as administrator/root
- Disable antivirus temporarily
- Check system requirements
- Ensure all files downloaded completely

#### Performance Issues
- Close other applications
- Update graphics drivers
- Check internet connection for online features
- Lower graphics settings in-game

#### File Download Issues
- Use a download manager for large files
- Check available disk space (builds can be 2GB+)
- Try different browsers or GitHub's download feature

### Getting Help
- Check [Installation Guide](OIAI%20PC%20Build%2011242025/cross-platform-installer/docs/README.md)
- Read platform-specific docs in the installer folders
- Report issues on [GitHub Issues](https://github.com/elonmasai7/OIAI_Edu/issues)

## � Support & Contact

- **📧 Email**: support@otermansinstitute.edu
- **🌐 Website**: [https://otermansinstitute.edu/oiaiedu](https://otermansinstitute.edu/oiaiedu)
- **📱 Social Media**: [@OIAIEdu](https://twitter.com/OIAIEdu)
- **💬 Discord**: [Join our community](https://discord.gg/oiaiedu)

### Getting Help
- **Documentation**: Check our [docs](docs/) first
- **Issues**: Report bugs on [GitHub Issues](https://github.com/elonmasai7/OIAI_Edu/issues)
- **Discussions**: Join community discussions on [GitHub Discussions](https://github.com/elonmasai7/OIAI_Edu/discussions)

---

<div align="center">

**Made with ❤️ by Oterman's Institute**

[🌟 Star us on GitHub](https://github.com/elonmasai7/OIAI_Edu) • [📖 Read the Docs](OIAI%20PC%20Build%2011242025/cross-platform-installer/docs/README.md) • [🚀 Download Now](#-download--install)

</div>
