#!/usr/bin/env zsh

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
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo -e "${PURPLE}Homebrew found. Updating Homebrew...${NC}"
    brew update && brew upgrade
fi

echo -e "${PURPLE}Heading to home directory...${NC}"

# Change directory to $HOME
cd "$HOME"


# Install needed dependencies
echo -e "${PURPLE}Checking for Homebrew dependencies...${NC}"
brew_install() {
	if [ -d "$(brew --prefix)/opt/$1" ]; then
		echo -e "${GREEN}found $1...${NC}"
	else
 		echo -e "${PURPLE}Did not find $1. Installing...${NC}"
		brew install $1
	fi
}

deps=( autoconf automake boost ccache cmake dylibbundler ffmpeg fmt glslang hidapi libtool libusb llvm@17 lz4 ninja nlohmann-json openssl pkg-config qt@6 sdl2 speexdsp vulkan-loader zlib zstd )

for dep in $deps[@]
do 
	brew_install $dep
done

# Clone the Suyu repository if not already cloned
if [ ! -d "suyu" ]; then
    echo -e "${PURPLE}Cloning Suyu repository...${NC}"
    git clone --recursive https://gitlab.com/suyu-emu/suyu.git/
    cd suyu
else
    echo -e "${PURPLE}Suyu repository already exists. Updating...${NC}"
    cd suyu

    echo -e "${PURPLE}Fetching latest changes...${NC}"
    
    git fetch origin master

    echo -e "${PURPLE}Removing existing submodules...${NC}"
    git submodule deinit -f .

    echo -e "${PURPLE}Fetching new submodules...${NC}"
    git submodule update --init --recursive
fi

echo -e "${PURPLE}Exporting necessary environment variables...${NC}"

# Export necessary environment variables
export LLVM_DIR=$(brew --prefix)/opt/llvm@17
export FFMPEG_DIR=$(brew --prefix)/opt/ffmpeg

echo -e "${PURPLE}Creating build folder...${NC}"

# Create build folder
mkdir -p build && cd build

echo -e "${PURPLE}Running CMake...${NC}"

# Run CMake with specified options
cmake .. -GNinja -DCMAKE_BUILD_TYPE=RELEASE \
	-DYUZU_USE_BUNDLED_VCPKG=OFF \
 	-DYUZU_TESTS=OFF \
  	-DENABLE_WEB_SERVICE=OFF \
   	-DENABLE_LIBUSB=OFF \
    	-DSDL_ARMNEON=ON \
     	-DENABLE_QT6=ON \
      	-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF

echo -e "${PURPLE}Building yuzu...${NC}"

# Build Suyu using Ninja
ninja

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build successful${NC}."

    # Remove existing Suyu.app if it exists in /Applications
    if [ -d "/Applications/yuzu.app" ]; then
        echo -e "${PURPLE}Removing existing Suyu.app in /Applications...${NC}"
        rm -rf "/Applications/yuzu.app"
    fi

    # Bundle dependencies and codesign
    dylibbundler -of -cd -b -x bin/yuzu.app/Contents/MacOS/yuzu -d bin/yuzu.app/Contents/libs/
    
    echo -e "${PURPLE}Moving yuzu.app to /Applications...${NC}"

    # Move Suyu.app to /Applications
    mv bin/yuzu.app /Applications/yuzu.app

    echo -e "${PURPLE}Installation completed.${NC}"

    # Remove build folder
    cd "$HOME/suyu"
    sudo rm -rf build
else
    echo -e "${RED}Build failed${NC}. Please check the build output for errors."
fi
