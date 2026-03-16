@echo off
REM Windows CMake Project Compiler (MinGW)
REM Usage: build.bat [project_path] [build_type] [jobs]

setlocal enabledelayedexpansion

set "PROJECT_DIR=%~1"
set "BUILD_TYPE=%~2"
set "JOBS=%~3"

if "%PROJECT_DIR%"=="" set "PROJECT_DIR=project"
if "%BUILD_TYPE%"=="" set "BUILD_TYPE=Release"
if "%JOBS%"=="" set "JOBS=8"

echo ========================================
echo Building %PROJECT_DIR% (%BUILD_TYPE%)
echo ========================================

cd /d "%~dp0%PROJECT_DIR%"

if not exist "build" mkdir build
cd build

echo.
echo [1/2] Running CMake configuration...
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ..

if %ERRORLEVEL% NEQ 0 (
    echo CMake configuration FAILED!
    exit /b 1
)

echo.
echo [2/2] Building project...
mingw32-make -j%JOBS%

if %ERRORLEVEL% NEQ 0 (
    echo Build FAILED!
    exit /b 1
)

echo.
echo ========================================
echo Build completed successfully!
echo ========================================

exit /b 0
