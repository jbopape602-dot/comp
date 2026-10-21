@echo off
setlocal
where cmake >nul 2>nul || (echo ERROR: CMake was not found. Install CMake first.& exit /b 1)
where git >nul 2>nul || (echo ERROR: Git was not found. Install Git first.& exit /b 1)
cmake -S . -B build -G "Visual Studio 17 2022" -A x64
if errorlevel 1 exit /b %errorlevel%
cmake --build build --config Release --target NAT2MADE_COMP_VST3 NAT2MADE_COMP_Standalone
if errorlevel 1 exit /b %errorlevel%
echo.
echo Build finished. Search the build folder for NAT2MADE COMP.vst3 and NAT2MADE COMP.exe.
echo If CMake cannot find Visual Studio, run this script from the x64 Native Tools Command Prompt for VS 2022.
endlocal
