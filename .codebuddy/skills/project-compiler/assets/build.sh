#!/bin/bash
# Linux CMake Project Compiler
# Usage: ./build.sh [project_path] [build_type]

PROJECT_DIR="${1:-project}"
BUILD_TYPE="${2:-Release}"

echo "========================================"
echo "Building $PROJECT_DIR ($BUILD_TYPE)"
echo "========================================"

cd "$PROJECT_DIR"

# Create build directory if not exists
if [ ! -d "build" ]; then
    mkdir build
fi
cd build

echo ""
echo "[1/2] Running CMake configuration..."
cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=$BUILD_TYPE

if [ $? -ne 0 ]; then
    echo "CMake configuration FAILED!"
    exit 1
fi

echo ""
echo "[2/2] Building project..."
make -j8

if [ $? -ne 0 ]; then
    echo "Build FAILED!"
    exit 1
fi

echo ""
echo "========================================"
echo "Build completed successfully!"
echo "========================================"

exit 0
