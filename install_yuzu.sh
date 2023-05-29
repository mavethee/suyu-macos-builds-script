#!/bin/bash

# ANSI color codes
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "${PURPLE}Homebrew not found. Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Amount of available cores:
CORES=$(sysctl -n hw.ncpu)

# Change directory to $HOME
cd $HOME

# Install needed dependencies
brew install autoconf fmt automake boost ccache ffmpeg glslang hidapi libtool libusb lz4 ninja nlohmann-json openssl pkg-config qt@5 sdl2 speexdsp zlib zstd molten-vk vulkan-loader

# Clone the Yuzu repository if not already cloned
if [ ! -d "yuzu" ]; then
    git clone --recursive https://github.com/yuzu-emu/yuzu
    cd yuzu
else
    echo -e "${PURPLE}Yuzu repository already exists.${NC}"
    cd yuzu
    git pull origin master
fi

# Export necessary environment variables
export Qt5_DIR=$(brew --prefix)/opt/qt@5/lib/cmake
export LLVM_DIR=$(brew --prefix)/opt/llvm@16

# Create build folder
mkdir -p build && cd build

# Run CMake with specified options
cmake .. -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DYUZU_USE_BUNDLED_VCPKG=OFF -DYUZU_TESTS=OFF -DENABLE_WEB_SERVICE=OFF -DENABLE_LIBUSB=OFF -DSDL_ARMNEON=ON

# Build Yuzu using Ninja with all available cores
ninja -j${CORES}

# Check if the build was successful
if [ $? -eq 0 ]; then
    # Remove existing yuzu.app if it exists in /Applications
    if [ -d "/Applications/yuzu.app" ]; then
        echo -e "${PURPLE}Removing existing yuzu.app in /Applications...${NC}"
        rm -rf "/Applications/yuzu.app"
    fi

    # Move yuzu.app to /Applications
    echo -e "${PURPLE}Moving yuzu.app to /Applications...${NC}"
    mv bin/yuzu.app /Applications/

    echo -e "${PURPLE}Installation completed.${NC}"

    # Remove build folder
    cd $HOME/yuzu
    rm -rf build
else
    echo -e "${PURPLE}Build failed. Please check the build output for errors.${NC}"
fi