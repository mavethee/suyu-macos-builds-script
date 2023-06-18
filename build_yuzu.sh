#!/bin/bash

# ANSI color codes
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${PURPLE}Checking for Homberew installation...${NC}"

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
brew install autoconf enet inih cubeb fmt automake boost ccache ffmpeg glslang hidapi libtool libusb lz4 ninja nlohmann-json openssl pkg-config qt@5 sdl2 speexdsp zlib zstd molten-vk vulkan-loader

echo -e "${PURPLE}Cloning or updating Yuzu repository...${NC}"

# Clone the Yuzu repository if not already cloned
if [ ! -d "yuzu" ]; then
    git clone --recursive https://github.com/yuzu-emu/yuzu
    cd yuzu
else
    echo "Yuzu repository already exists. Updating..."
    cd yuzu
    git pull origin master

    echo -e "${PURPLE}Updating submodules...${NC}"

    # Update submodules
    git submodule update --init --recursive
fi

echo -e "${PURPLE}Looking for nx_tzdb's CMakeLists.txt...${NC}"

# Define the path to the CMakeLists.txt file
CMAKE_LISTS_FILE="/Users/$(whoami)/yuzu/externals/nx_tzdb/tzdb_to_nx/src/tzdb/CMakeLists.txt"

# Define the line to search for and its replacement
SEARCH_LINE='${GNU_DATE} +%y%m%d --date=@${TZ_COMMIT_TIME}'
REPLACE_LINE='${GNU_DATE} +%y%m%d'

# Function to replace the line in CMakeLists.txt
replace_line_in_cmake() {
    if [ -f "$CMAKE_LISTS_FILE" ]; then
        echo "CMakeLists.txt file found at path: $CMAKE_LISTS_FILE"

        # Replace the line using sed
        sed -i '' "s|${SEARCH_LINE}|${REPLACE_LINE}|g" "$CMAKE_LISTS_FILE"

        # Check if the replacement was successful
        if [ $? -eq 0 ]; then
            echo "Fixed macOS incompatible arguments in CMakeLists.txt."
        else
            echo "Failed to fix macOS incompatible arguments in CMakeLists.txt. Build script may fail with line 27!"
        fi
    else
        echo "CMakeLists.txt file not found at path: $CMAKE_LISTS_FILE"
    fi
}

# Check if the CMakeLists.txt file needs line replacement
if grep -q "$SEARCH_LINE" "$CMAKE_LISTS_FILE"; then
    echo "Found line to replace: $SEARCH_LINE"
    replace_line_in_cmake
else
    echo "No matching line found in CMakeLists.txt. No modification needed."
fi



echo -e "${PURPLE}Exporting necessary environment variables...${NC}"

# Export necessary environment variables
export Qt5_DIR=$(brew --prefix)/opt/qt@5/lib/cmake
export LLVM_DIR=$(brew --prefix)/opt/llvm@16

echo -e "${PURPLE}Creating build folder...${NC}"

# Create build folder
mkdir -p build && cd build

echo -e "${PURPLE}Running CMake...${NC}"

# Run CMake with specified options
cmake .. -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DYUZU_USE_BUNDLED_VCPKG=OFF -DYUZU_TESTS=OFF -DENABLE_WEB_SERVICE=OFF -DENABLE_LIBUSB=OFF -DSDL_ARMNEON=ON

echo -e "${PURPLE}Building Yuzu...${NC}"

# Build Yuzu using Ninja with all available cores
ninja -j${CORES}

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Build successful."

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
    echo "Build failed. Please check the build output for errors."
fi