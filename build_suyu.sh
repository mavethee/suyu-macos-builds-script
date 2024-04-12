#!/usr/bin/env zsh

# ANSI color codes
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${PURPLE}Checking for Homebrew installation...${NC}"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "${RED}Homebrew not found.${PURPLE}Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo -e "${GREEN}Homebrew found.${NC}"
fi

echo -e "${PURPLE}Heading to home directory...${NC}"

# Change directory to $HOME
cd "$HOME"


# Install needed dependencies
echo -e "${PURPLE}Checking for Homebrew dependencies...${NC}"
brew_install() {
	if [ -d "$(brew --prefix)/opt/$1" ]; then
		echo -e "${GREEN}Found $1...${NC}"
	else
 		echo -e "${RED}Package $1 not found. ${PURPLE}Installing...${NC}"
		brew install $1
	fi
}

dependencies=(
autoconf 
automake 
boost 
ccache 
cmake 
dylibbundler 
ffmpeg 
fmt 
glslang 
hidapi 
libtool 
libusb 
llvm@17 
lz4 
ninja 
nlohmann-json 
openssl 
pkg-config 
qt@6 
sdl2 
speexdsp 
vulkan-loader 
zlib 
zstd
)

for dependency in $dependencies[@]
do 
	brew_install $dependency
done

# Clone the Suyu repository if not already cloned
if [ ! -d "suyu" ]; then
    echo -e "${PURPLE}Cloning Suyu repository...${NC}"
    git clone --recursive https://git.suyu.dev/suyu/suyu
    cd suyu
else
    echo -e "${PURPLE}Suyu repository already exists. Updating...${NC}"
    cd suyu

    echo -e "${PURPLE}Pulling latest changes...${NC}"
    git pull origin dev

    echo -e "${PURPLE}Removing existing submodules...${NC}"
    git submodule deinit -f .

    echo -e "${PURPLE}Fetching new submodules...${NC}"
    git submodule update --init --recursive
fi

# Export necessary environment variables
echo -e "${PURPLE}Exporting necessary environment variables...${NC}"
export LLVM_DIR=$(brew --prefix)/opt/llvm@17
export FFMPEG_DIR=$(brew --prefix)/opt/ffmpeg

# Create build folder
echo -e "${PURPLE}Creating build folder...${NC}"
mkdir -p build && cd build

# Run CMake with specified options:
echo -e "${PURPLE}Running CMake...${NC}"
cmake .. -GNinja \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DSUYU_USE_BUNDLED_VCPKG=OFF \
    -DSUYU_TESTS=OFF \
    -DENABLE_WEB_SERVICE=OFF \
    -DENABLE_LIBUSB=OFF \
    -DSDL_ARMNEON=ON \
    -DENABLE_QT6=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DSUYU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DUSE_SYSTEM_MOLTENVK=OFF

# Build Suyu using Ninja
echo -e "${PURPLE}Building suyu using Ninja...${NC}"
ninja

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build successful.${NC}"

    # Remove existing Suyu.app if it exists in /Applications
    if [ -d "/Applications/suyu.app" ]; then
        echo -e "${PURPLE}Removing existing Suyu.app in /Applications...${NC}"
        rm -rf "/Applications/suyu.app"
    fi

    # Bundle dependencies and codesign
    echo -e "${PURPLE}Bundling and codesigning dependencies...${NC}"
    dylibbundler -of -cd -b -x bin/suyu.app/Contents/MacOS/suyu -d bin/suyu.app/Contents/libs/
    
    # Move Suyu.app to /Applications
    echo -e "${PURPLE}Moving suyu.app to /Applications...${NC}"
    mv bin/suyu.app /Applications/suyu.app

    # Remove build folder
    echo -e "${PURPLE}Cleaning up build files...${NC}"
    echo -e "${PURPLE}Optional, don't worry if it fails.${NC}"
    echo -e "${RED}You may be asked to provide an administrator password...${NC}"
    cd "$HOME/suyu"
    sudo rm -rf build

    echo -e "${GREEN}Installation completed.${NC}"

else
    echo -e "${RED}Build failed.${PURPLE}Please check the build output for errors.${NC}."
fi
