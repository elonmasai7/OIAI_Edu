# 🎓 OIAI Edu - Cross-Platform Educational Platform

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Cross--Platform-green.svg)](https://github.com/elonmasai7/OIAI_Edu)
[![Unity](https://img.shields.io/badge/Unity-2021.3+-black.svg)](https://unity.com/)

> **Oterman's Institute AI Education Platform** - Revolutionizing education through AI-powered learning experiences across all major platforms.

![OIAI Edu Banner](https://via.placeholder.com/1200x300/4F46E5/FFFFFF?text=OIAI+Edu+-+AI+Powered+Education)

## 🌟 Features

- **🤖 AI-Powered Learning**: Advanced AI algorithms adapt to individual learning styles
- **🎯 Personalized Curriculum**: Custom learning paths based on student progress and goals
- **📊 Real-time Analytics**: Comprehensive tracking of learning outcomes and engagement
- **🎮 Interactive Experiences**: Immersive 3D environments and gamified learning modules
- **🌐 Multi-Platform Support**: Seamless experience across Windows, Linux, macOS, and iOS
- **🔒 Secure & Private**: Enterprise-grade security with data protection compliance

## 📥 Download & Install

### 🚀 Quick Start Installation

Choose your platform and get started in minutes:

#### 🪟 Windows (10+)
```bash
# Download the installer
curl -L https://github.com/elonmasai7/OIAI_Edu/releases/latest/download/OIAI_Edu_Windows.zip -o installer.zip
unzip installer.zip
cd cross-platform-installer
install.bat
```

#### 🐧 Linux (Ubuntu/Debian, CentOS/RHEL, Arch)
```bash
# Download the installer
wget https://github.com/elonmasai7/OIAI_Edu/releases/latest/download/OIAI_Edu_Linux.tar.gz
tar -xzf OIAI_Edu_Linux.tar.gz
cd cross-platform-installer
chmod +x scripts/install.sh
./scripts/install.sh
```

#### 🍎 macOS (10.12+)
```bash
# Download the installer
curl -L https://github.com/elonmasai7/OIAI_Edu/releases/latest/download/OIAI_Edu_macOS.dmg -o installer.dmg
hdiutil attach installer.dmg
cp -r /Volumes/OIAI_Edu/OIAIEdu.app /Applications/
```

#### 📱 iOS (12.0+)
Available on the **App Store** - Search for "OIAI Edu" or visit:
- [📱 App Store](https://apps.apple.com/app/oiaiedu)
- [🧪 TestFlight](https://testflight.apple.com/join/oiaiedu)

### 📦 Manual Installation

For advanced users or custom deployments:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/elonmasai7/OIAI_Edu.git
   cd OIAI_Edu
   ```

2. **Choose your platform**:
   - Windows: `cd cross-platform-installer/windows && ./OIAIEdu.exe`
   - Linux: `cd cross-platform-installer/linux && ./OIAIEdu`
   - macOS: `cd cross-platform-installer/macos && ./OIAIEdu`

3. **Run the installer**:
   ```bash
   # Automated installation
   ./scripts/install.sh    # Linux/macOS
   install.bat            # Windows
   ```

## 🖥️ System Requirements

### Minimum Requirements
- **RAM**: 4GB
- **Storage**: 2GB free space
- **Graphics**: OpenGL 3.2+ or DirectX 11+
- **Network**: Broadband internet connection

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
- Visual C++ Redistributables

#### Linux
- Ubuntu 18.04+, CentOS 7+, or equivalent
- GTK+ 3.0 libraries
- ALSA audio libraries

#### macOS
- macOS Monterey (12.0) or later
- Metal graphics API support
- 4GB RAM minimum

#### iOS
- iOS 12.0 or later
- iPhone 6s or newer / iPad 5th gen or newer
- 2GB free storage space

## 🎯 Key Features

### 📚 Learning Modules
- **Mathematics**: Algebra, Calculus, Statistics
- **Science**: Physics, Chemistry, Biology
- **Programming**: Multiple languages and frameworks
- **Languages**: English, Spanish, French, and more
- **Arts & Humanities**: History, Literature, Art History

### 🎮 Interactive Learning
- **3D Visualizations**: Immersive learning environments
- **Gamification**: Points, badges, and leaderboards
- **Real-time Feedback**: Instant assessment and guidance
- **Collaborative Learning**: Multi-user classrooms and study groups

### 📊 Analytics & Tracking
- **Progress Monitoring**: Detailed learning analytics
- **Performance Reports**: Comprehensive assessment tools
- **Custom Dashboards**: Personalized learning insights
- **Parent/Teacher Access**: Family and educator portals

## 🛠️ Development

### Prerequisites
- **Unity 2021.3+** with platform build support
- **Git** for version control
- **Platform SDKs**:
  - Windows SDK (for Windows builds)
  - Xcode (for macOS/iOS builds)
  - Linux development tools (for Linux builds)

### Building from Source

1. **Clone and setup**:
   ```bash
   git clone https://github.com/elonmasai7/OIAI_Edu.git
   cd OIAI_Edu
   ```

2. **Open in Unity**:
   - Launch Unity Hub
   - Add project from cloned directory
   - Open with Unity 2021.3+

3. **Build for target platforms**:
   ```bash
   # Run the build script
   chmod +x cross-platform-installer/scripts/build-all-platforms.sh
   ./cross-platform-installer/scripts/build-all-platforms.sh
   ```

### Platform-Specific Builds

#### Windows Build
1. File → Build Settings → PC, Mac & Linux Standalone
2. Target Platform: Windows
3. Architecture: x86_64
4. Build

#### Linux Build
1. Switch Target Platform to Linux
2. Architecture: x86_64
3. Build

#### macOS Build
1. Switch Target Platform to macOS
2. Architecture: Intel 64-bit and Apple Silicon
3. Build

#### iOS Build
1. Install iOS Build Support in Unity Hub
2. Switch Target Platform to iOS
3. Configure Player Settings
4. Build → Open in Xcode → Archive

## 📖 Documentation

- **[Installation Guide](cross-platform-installer/docs/README.md)**: Detailed setup instructions
- **[iOS Build Guide](cross-platform-installer/ios/README.md)**: iOS development and deployment
- **[API Documentation](docs/api/)**: Developer API reference
- **[Troubleshooting](docs/troubleshooting.md)**: Common issues and solutions

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Workflow
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Unity's C# coding standards
- Use meaningful variable and method names
- Include XML documentation comments
- Write unit tests for new features

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support & Contact

- **📧 Email**: support@otermansinstitute.edu
- **🌐 Website**: [https://otermansinstitute.edu/oiaiedu](https://otermansinstitute.edu/oiaiedu)
- **📱 Social Media**: [@OIAIEdu](https://twitter.com/OIAIEdu)
- **💬 Discord**: [Join our community](https://discord.gg/oiaiedu)

### Getting Help
- **Documentation**: Check our [docs](docs/) first
- **Issues**: Report bugs on [GitHub Issues](https://github.com/elonmasai7/OIAI_Edu/issues)
- **Discussions**: Join community discussions on [GitHub Discussions](https://github.com/elonmasai7/OIAI_Edu/discussions)

## 🙏 Acknowledgments

- **Oterman's Institute** for visionary leadership in AI education
- **Unity Technologies** for the powerful game development platform
- **Open Source Community** for invaluable tools and libraries
- **Beta Testers** for feedback and quality assurance

## 📈 Roadmap

### Version 1.1.0 (Coming Soon)
- [ ] Enhanced AI personalization algorithms
- [ ] Mobile app improvements
- [ ] Offline learning capabilities
- [ ] Multi-language support expansion

### Version 1.2.0 (Future)
- [ ] VR/AR learning experiences
- [ ] Advanced analytics dashboard
- [ ] Teacher collaboration tools
- [ ] Custom curriculum builder

---

<div align="center">

**Made with ❤️ by Oterman's Institute**

[🌟 Star us on GitHub](https://github.com/elonmasai7/OIAI_Edu) • [📖 Read the Docs](cross-platform-installer/docs/README.md) • [🚀 Download Now](#-download--install)

</div>