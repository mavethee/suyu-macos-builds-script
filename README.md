<img src="https://raw.githubusercontent.com/yuzu-emu/yuzu-assets/master/icons/icon.png" width="10%" height="10%"/> 

## Yuzu's macOS builds compiling script

[🇵🇱 Szukasz Polskiego? Kliknij tutaj](README_pl_PL.md) [🇺🇸 You are reading English version](README.md)

This script will build and compile Yuzu for macOS.

Remember to not expect miracles, it's not ready for end users yet. 

The macOS build is still in development!

This script is based off of these build instructions:

https://yuzu-emu.org/wiki/building-for-macos/

## Original Yuzu's repository:

https://github.com/yuzu-emu/yuzu

[![Download](https://img.shields.io/badge/Download-v0.0.1-brightgreen)](https://github.com/mavethee/yuzu-macos-builds-script/releases/download/0.0.1/build_yuzu.sh)

## Usage:

After downloading, double click and follow the prompts.

Preferrably execute in your home directory.

On base M1, building takes ~4mins (measured including gathering needed dependencies which differs on your internet speed)

In case of any permission issues, run:

```
chmod +x ./build_yuzu.sh
```

Yuzu currently does not support a lot of required features such as Geometry Shaders or Transform Feedback Buffers. </br>
If a game you are trying to play uses these features, it will crash.
If you want to know what missing feature is causing the crash, run yuzu through Terminal: </br>

```
/Applications/yuzu.app/Contents/MacOS/yuzu
```

The situation will get better in the future as MoltenVK adds support for more features.

## Check current compatibility:

[Compatiblity List](Compatibility.md)

## Building:

## 1. Clone the repository to your home directory:

```
git clone https://github.com/mavethee/yuzu-macos-builds-script.git
cd yuzu-macos-builds-script
```

## 2. Make sure cloned repo is up to date:

```
git pull origin main
```

## 3. Copy the script to a location on your home directory:

```
ditto build_yuzu.sh $HOME/build_yuzu.sh
```

## 4. Make the script executable:

```
chmod +x $HOME/build_yuzu.sh
```

## 5. Run the build script:

```
$HOME/build_yuzu.sh
```

## 6. Enjoy!

Note: Remember to repeat STEP 2 for future script changes. </br>
## Credits:

- Yuzu team:

    https://github.com/yuzu-emu

    (🍺 Give those dudes a tip here: https://www.patreon.com/yuzuteam)

- Yuzu's macOS build instructios:

    https://yuzu-emu.org/wiki/building-for-macos/

    ...and ChatGPT with GitHub Copilot for making my drunkass shell coding public.

    If I get sued by Big N, come visit my grave ^^

    ![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
