@echo off
REM Clean CMake Project Build
REM Usage: clean.bat [project_path]

setlocal

set "PROJECT_DIR=%~1"

if "%PROJECT_DIR%"=="" set "PROJECT_DIR=project"

echo Cleaning build directory in %PROJECT_DIR%...

if exist "%PROJECT_DIR%\build" (
    rmdir /s /q "%PROJECT_DIR%\build"
    echo Build directory cleaned!
) else (
    echo No build directory found.
)

exit /b 0
