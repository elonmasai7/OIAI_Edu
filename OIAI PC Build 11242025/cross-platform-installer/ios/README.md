# OIAI Edu - iOS Build Instructions

## Prerequisites

1. **Unity iOS Build Support**: Install iOS build support in Unity Hub
2. **Xcode**: Install Xcode from Mac App Store (version 13.0+ recommended)
3. **Apple Developer Account**: Required for code signing and distribution
4. **macOS**: macOS Monterey (12.0) or later

## Build Steps

### 1. Unity Project Setup

1. Open the Unity project in Unity Editor
2. Go to **File → Build Settings**
3. Select **"iOS"** as the target platform
4. Click **"Switch Platform"** (this may take several minutes)

### 2. Configure Player Settings

1. Go to **Edit → Project Settings → Player**
2. Configure the following settings:

#### Player Settings Configuration
```
Company Name: Oterman's Institute
Product Name: OIAIEdu
Version: 1.0.0
Bundle Identifier: com.otermansinstitute.oiaiedu
Bundle Version: 1.0.0
```

#### iOS Settings
```
Target minimum iOS Version: 12.0
Target SDK: Device SDK
Architecture: ARM64
Scripting Backend: IL2CPP
API Compatibility Level: .NET Standard 2.1
```

#### Icon and Splash Images
- Prepare app icons in various sizes (20x20, 29x29, 40x40, 60x60, 76x76, 83.5x83.5, 1024x1024)
- Prepare launch screen images
- Set icons in Player Settings → iOS → Icon

### 3. Build for iOS

1. In **Build Settings**, click **"Build"**
2. Choose a folder for the Xcode project output
3. Unity will generate an Xcode project (this may take several minutes)

### 4. Xcode Configuration

1. **Open the Generated Xcode Project**
   - Navigate to the build folder
   - Open the `.xcodeproj` file

2. **Configure Code Signing**
   - Select your development team
   - Choose appropriate provisioning profile
   - Ensure bundle identifier matches Unity settings

3. **Set Deployment Target**
   - Set iOS Deployment Target to 12.0 or higher
   - Enable Metal API validation if needed

4. **Build and Test**
   - Select a connected iOS device or simulator
   - Build and run to test the application

### 5. Distribution Options

#### TestFlight (Beta Testing)

1. **Archive the Build**
   - In Xcode: Product → Archive
   - Wait for archiving to complete

2. **Upload to App Store Connect**
   - Click "Distribute App"
   - Select "App Store Connect"
   - Choose "TestFlight & App Store"

3. **Configure TestFlight**
   - Go to App Store Connect
   - Navigate to TestFlight
   - Add internal/external testers
   - Set test information and screenshots

#### App Store (Production Release)

1. **Prepare App Store Assets**
   - Screenshots for various device sizes
   - App description and keywords
   - Privacy policy URL
   - Support URL

2. **Submit for Review**
   - Archive and upload to App Store Connect
   - Fill out app information
   - Set pricing and availability
   - Submit for Apple review

#### Ad-Hoc/Sideloading

1. **Create Ad-Hoc Provisioning Profile**
   - Register device UDIDs in Apple Developer portal
   - Create Ad-Hoc distribution profile

2. **Build IPA File**
   - Archive the build
   - Export as Ad-Hoc
   - Generate .ipa file

3. **Distribute IPA**
   - Use services like Diawi or TestFairy
   - Share download link with registered devices
   - Install via iTunes/Finder or third-party tools

## iOS-Specific Features and Optimizations

### Touch Controls
- Adapt UI elements for touch interaction
- Implement gesture recognizers
- Optimize button sizes (minimum 44x44pt recommended)

### Performance Optimization
- Use Metal graphics API
- Optimize texture compression (ASTC recommended)
- Implement level-of-detail (LOD) for 3D models
- Minimize draw calls and optimize shaders

### Storage and File System
- Handle iOS file system restrictions
- Use Application.persistentDataPath for user data
- Implement proper save/load functionality

### Network Considerations
- Handle cellular data usage appropriately
- Implement offline functionality where possible
- Use appropriate timeout values for network requests

## Troubleshooting

### Common Build Issues

#### "Unity iOS Support not found"
- Install iOS Build Support in Unity Hub
- Restart Unity Editor
- Check Unity version compatibility

#### Code Signing Errors
- Ensure Apple Developer account is active
- Verify provisioning profile matches bundle ID
- Check certificate validity
- Clean and rebuild project

#### Provisioning Profile Issues
- Register device UDIDs in Apple Developer portal
- Ensure bundle identifier is unique
- Regenerate provisioning profiles if needed

#### Build Fails with Architecture Errors
- Ensure ARM64 architecture is selected
- Check Unity iOS version compatibility
- Update to latest Xcode version

### Runtime Issues

#### App Crashes on Launch
- Check device logs in Xcode
- Verify minimum iOS version compatibility
- Test on different device models

#### Graphics Performance Issues
- Enable Metal validation in Xcode
- Check for shader compilation errors
- Optimize texture sizes and compression

#### Memory Issues
- Monitor memory usage in Xcode Instruments
- Implement texture streaming
- Optimize asset loading

## Required Assets and Resources

### App Store Assets
- App icons (various sizes)
- Screenshots (iPhone and iPad)
- App preview videos (optional)
- Promotional images

### In-App Assets
- Optimized textures (ASTC compression)
- Compressed audio files
- Efficient 3D models with LOD

### Metadata
- App description (max 4000 characters)
- Keywords for App Store search
- Support and marketing URLs
- Privacy policy

## Testing and Quality Assurance

### Device Testing
- Test on multiple iOS versions (12.0+)
- Test on various device sizes (iPhone, iPad)
- Verify performance on older devices

### TestFlight Testing
- Distribute beta builds to testers
- Collect feedback and crash reports
- Iterate based on tester feedback

### App Store Review Preparation
- Test all app features thoroughly
- Ensure compliance with App Store guidelines
- Prepare responses for common review questions

## Distribution Checklist

- [ ] Apple Developer account configured
- [ ] App Store Connect app record created
- [ ] Bundle identifier reserved
- [ ] Provisioning profiles created
- [ ] TestFlight testing completed
- [ ] App Store assets prepared
- [ ] Privacy policy and terms ready
- [ ] Beta testing feedback incorporated
- [ ] Final testing on target devices completed
- [ ] App Store submission prepared

## Support and Resources

### Apple Documentation
- [iOS Development Guide](https://developer.apple.com/ios/)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)
- [Xcode Help](https://help.apple.com/xcode/)

### Unity Resources
- [Unity iOS Documentation](https://docs.unity3d.com/Manual/ios.html)
- [iOS Build Troubleshooting](https://docs.unity3d.com/Manual/TroubleshootingiOS.html)

### Community Support
- Unity Forums - iOS Development
- Stack Overflow - iOS/Unity questions
- Apple Developer Forums

## Version History

- **iOS Build Setup v1.0.0**: Initial iOS build configuration
  - Unity 2021.3+ compatibility
  - iOS 12.0+ support
  - ARM64 architecture
  - TestFlight and App Store distribution