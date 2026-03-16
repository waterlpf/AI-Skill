#!/bin/bash
# Clean CMake Project Build
# Usage: ./clean.sh [project_path]

PROJECT_DIR="${1:-project}"

echo "Cleaning build directory in $PROJECT_DIR..."

if [ -d "$PROJECT_DIR/build" ]; then
    rm -rf "$PROJECT_DIR/build"
    echo "Build directory cleaned!"
else
    echo "No build directory found."
fi

exit 0
