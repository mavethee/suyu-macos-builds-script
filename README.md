<img src="./assets/icons/yuzu_icon.png" width="20%" height="20%" align="right"/> 

## Build script for compiling Yuzu on Apple Silicon

[🇵🇱 Szukasz Polskiego? Kliknij tutaj](README_pl_PL.md) [🇺🇸 You are reading English version](README.md)

This script will build and compile Yuzu for macOS on Apple Silicon.

> [!WARNING]
> This script is provided for experimentation purposes.<br> 
> Don't expect high compatibility, there are reasons why an official Mac build hasn't been released yet.<br>
> The macOS build is still in development!

Get it from here!

[![Download](https://img.shields.io/badge/Download-v0.0.6-brightgreen)](https://github.com/mavethee/yuzu-macos-builds-script/releases/download/0.0.6/build_yuzu.sh)

## Usage:

After downloading, double click the script and follow the prompts.

It is advised to run it from your home directory.

> [!NOTE]
> On a base M1, building takes ~4mins (measured including gathering needed dependencies which differs depending on your internet speed)
> In case of any permission issues, run:
> ```
> chmod +x ./build_yuzu.sh
> ```

> [!NOTE]
> Yuzu currently does not support a lot of required features.<br>
> If a game you are trying to play uses these features, it will crash. <br>
> If you want to know what missing feature is causing the crash, run yuzu through Terminal:
>
> ```
> /Applications/yuzu.app/Contents/MacOS/yuzu
> ```
> The situation will get better in the future as MoltenVK adds support for more features.

## Check current compatibility:

[Compatiblity List](./assets/compatibility/compatibility.md)

## Building:

## 1. Clone the repository to your home directory:

```sh
git clone https://github.com/mavethee/yuzu-macos-builds-script.git
cd yuzu-macos-builds-script
```

## 2. Make sure cloned repo is up to date:

```sh
git pull origin main
```

## 3. Copy the script to a location on your home directory:

```sh
ditto build_yuzu.sh $HOME/build_yuzu.sh
```

## 4. Make the script executable:

```sh
chmod +x $HOME/build_yuzu.sh
```

## 5. Run the build script:

```sh
$HOME/build_yuzu.sh
```

## 6. Enjoy!

Note: Remember to repeat STEP 2 for future script changes. </br>

## Special thanks to:

- Yuzu's macOS build instructions archived [here](https://web.archive.org/web/20240113191459/https://yuzu-emu.org/wiki/building-for-macos/)

    ...and ChatGPT with GitHub Copilot for making my drunkass shell coding public.

- [@shinra-electric](https://github.com/shinra-electric) for helping me maintain it and bringing some code quality 🍺

    If I get sued by Big N, come visit my grave ^^

    ![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
