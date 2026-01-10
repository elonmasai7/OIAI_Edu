@echo off
setlocal enabledelayedexpansion

:: OIAI Edu Cross-Platform Installer (Windows)
:: Supports Windows installation

:: Colors for Windows (limited support)
set "RED=[91m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "BLUE=[94m"
set "NC=[0m"

:: Application information
set "APP_NAME=OIAIEdu"
set "APP_VERSION=1.0.0"
set "APP_DESCRIPTION=Oterman's Institute AI Education Platform"

:: Get script directory
set "SCRIPT_DIR=%~dp0"
set "SOURCE_DIR=%SCRIPT_DIR%.."

:: Installation directory
set "INSTALL_DIR=%LOCALAPPDATA%\%APP_NAME%"

:detect_platform
echo Detecting platform...
set "PLATFORM=windows"
echo Platform: %PLATFORM%
goto check_requirements

:check_requirements
echo Checking system requirements...

:: Check Windows version (minimum Windows 10)
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%VERSION%"=="10.0" (
    echo Windows 10 detected - OK
) else (
    echo Warning: This application is optimized for Windows 10+
)

:: Check available disk space (minimum 2GB)
for /f "tokens=3" %%a in ('dir /-c %SYSTEMDRIVE% ^| find "bytes free"') do (
    set "FREE_SPACE=%%a"
    set "FREE_SPACE=!FREE_SPACE: =!"
    set "FREE_SPACE=!FREE_SPACE:,=!"
)

:: Convert to MB for comparison (rough estimate)
set /a "FREE_MB=%FREE_SPACE%/1048576"
if %FREE_MB% lss 2048 (
    echo Error: Insufficient disk space. At least 2GB required.
    echo Available: %FREE_MB% MB
    goto error
)

echo System requirements check passed.
goto set_install_dir

:set_install_dir
echo Installation directory: %INSTALL_DIR%
goto confirm_install

:confirm_install
echo.
echo This will install %APP_NAME% to: %INSTALL_DIR%
set /p "CONFIRM=Continue? (y/N): "
if /i not "!CONFIRM!"=="y" (
    echo Installation cancelled.
    goto end
)
goto install_windows

:install_windows
echo Installing %APP_NAME% for Windows...

:: Create installation directory
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

:: Copy application files
xcopy "%SOURCE_DIR%\windows\*.*" "%INSTALL_DIR%\" /E /I /H /Y

:: Create desktop shortcut
set "DESKTOP_SHORTCUT=%USERPROFILE%\Desktop\%APP_NAME%.lnk"
if exist "%DESKTOP_SHORTCUT%" del "%DESKTOP_SHORTCUT%"

:: Create shortcut using PowerShell
powershell "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%DESKTOP_SHORTCUT%'); $s.TargetPath = '%INSTALL_DIR%\%APP_NAME%.exe'; $s.WorkingDirectory = '%INSTALL_DIR%'; $s.Description = '%APP_DESCRIPTION%'; $s.Save()"

:: Create start menu shortcut
set "START_MENU_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs"
if not exist "%START_MENU_DIR%" mkdir "%START_MENU_DIR%"
set "START_MENU_SHORTCUT=%START_MENU_DIR%\%APP_NAME%.lnk"

powershell "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%START_MENU_SHORTCUT%'); $s.TargetPath = '%INSTALL_DIR%\%APP_NAME%.exe'; $s.WorkingDirectory = '%INSTALL_DIR%'; $s.Description = '%APP_DESCRIPTION%'; $s.Save()"

:: Add to PATH (optional)
set "PATH_ENTRY=%INSTALL_DIR%"
setx PATH "%PATH%;%PATH_ENTRY%" /M >nul 2>&1

echo Windows installation completed.
goto create_uninstaller

:create_uninstaller
:: Create uninstaller
set "UNINSTALLER=%INSTALL_DIR%\uninstall.bat"
(
echo @echo off
echo echo Uninstalling %APP_NAME%...
echo rmdir /s /q "%INSTALL_DIR%"
echo del "%DESKTOP_SHORTCUT%"
echo del "%START_MENU_SHORTCUT%"
echo echo %APP_NAME% uninstalled successfully.
echo pause
) > "%UNINSTALLER%"

goto success

:error
echo Installation failed.
pause
exit /b 1

:success
echo.
echo Installation completed successfully!
echo You can now run %APP_NAME% from:
echo - Desktop shortcut
echo - Start Menu
echo - %INSTALL_DIR%\%APP_NAME%.exe
echo.
echo To uninstall, run: %INSTALL_DIR%\uninstall.bat
pause
goto end

:help
echo Usage: %0 [OPTIONS]
echo.
echo Windows installer for %APP_NAME%
echo.
echo Options:
echo   --help, -h          Show this help message
echo   --version, -v       Show version information
echo   --uninstall         Uninstall the application
echo.
goto end

:version
echo %APP_NAME% Installer %APP_VERSION%
goto end

:main
if "%1"=="--help" goto help
if "%1"=="-h" goto help
if "%1"=="--version" goto version
if "%1"=="-v" goto version
if "%1"=="--uninstall" (
    echo Uninstall functionality: Run uninstall.bat from the installation directory
    goto end
)

goto detect_platform

:end
endlocal