#!/bin/bash

# Export libVulkan path
export LIBVULKAN_PATH=/opt/homebrew/lib/libvulkan.dylib

# Run Yuzu
/Applications/yuzu.app/Contents/MacOS/yuzu >> log.txt
