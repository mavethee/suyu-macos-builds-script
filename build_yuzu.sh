#!/bin/bash

# ANSI color codes
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${PURPLE}Checking for Homebrew installation...${NC}"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "${PURPLE}Homebrew not found. Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${PURPLE}Homebrew found. Updating Homebrew...${NC}"
    brew update && brew upgrade
fi

echo -e "${PURPLE}Heading to home directory...${NC}"

# Amount of available cores:
CORES=$(sysctl -n hw.ncpu)

# Change directory to $HOME
cd "$HOME"

# Install needed dependencies
brew install autoconf enet inih cubeb fmt automake boost ccache ffmpeg glslang hidapi libtool libusb lz4 ninja nlohmann-json openssl pkg-config qt@6 sdl2 speexdsp zlib zstd molten-vk vulkan-loader

echo -e "${PURPLE}Cloning or updating Yuzu repository...${NC}"

# Clone the Yuzu repository if not already cloned
if [ ! -d "yuzu" ]; then
    git clone --recursive https://github.com/yuzu-emu/yuzu
    cd yuzu
else
    echo "Yuzu repository already exists. Updating..."
    cd yuzu

    echo -e "${PURPLE}Fetching latest changes...${NC}"
    
    git fetch origin master

    # Pull latest changes
    git pull origin master

    echo -e "${PURPLE}Updating submodules...${NC}"

    # Update submodules
    git submodule update --init --recursive
fi

echo -e "${PURPLE}Exporting necessary environment variables...${NC}"

# Export necessary environment variables
export LLVM_DIR=$(brew --prefix)/opt/llvm@16
export FFMPEG_DIR=$(brew --prefix)/opt/ffmpeg
export cubeb_DIR=$(brew --prefix)/opt/cubeb

echo -e "${PURPLE}Creating build folder...${NC}"

# Create build folder
mkdir -p build && cd build

echo -e "${PURPLE}Running CMake...${NC}"

# Run CMake with specified options
cmake .. -GNinja -DCMAKE_BUILD_TYPE=RELEASE -DYUZU_USE_BUNDLED_VCPKG=OFF -DYUZU_TESTS=OFF -DENABLE_WEB_SERVICE=OFF -DENABLE_LIBUSB=OFF -DSDL_ARMNEON=ON -DENABLE_QT6=ON -DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF

echo -e "${PURPLE}Building Yuzu...${NC}"

# Build Yuzu using Ninja with all available cores
ninja -j${CORES}

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo -e "Build ${GREEN}successful${NC}."

    # Remove existing yuzu.app if it exists in /Applications
    if [ -d "/Applications/yuzu.app" ]; then
        echo -e "${PURPLE}Removing existing yuzu.app in /Applications...${NC}"
        rm -rf "/Applications/yuzu.app"
    fi
    
    echo -e "${PURPLE}Moving yuzu.app to /Applications...${NC}"

    # Move yuzu.app to /Applications
    mv bin/yuzu.app /Applications/

    echo -e "${PURPLE}Installation completed.${NC}"

    # Remove build folder
    cd "$HOME/yuzu"
    rm -rf build
else
    echo -e "Build ${RED}failed${NC}. Please check the build output for errors."
fi