<img src="https://raw.githubusercontent.com/yuzu-emu/yuzu-assets/master/icons/icon.png" width="10%" height="10%"/> 

## Yuzu's macOS build and compile script:

This script will build and compile Yuzu for macOS.

Remember to not expect miracles, it's not ready for end users yet. The macOS build is still in development!

This script is based off of these build instructions:
https://yuzu-emu.org/wiki/building-for-macos/

## Original Yuzu's repository:

https://github.com/yuzu-emu/yuzu

# Instructions:

## 1. Clone the repository (or Code -> Download ZIP). Examples here use the $HOME directory:

```
$HOME && git clone https://github.com/mavethee/yuzu-macos-builds-script.git
```

## 2. Make sure cloned repo is up to date:

```
cd $HOME/yuzu-macos-builds-script && git pull origin main
```

## 3. Move the script to a location on your drive:

```
mv build_yuzu.sh $HOME
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
Yuzu currently does not support a lot of required features such as Geometry Shaders or Transform Feedback Buffers. </br>
If a game you are trying to play uses these features, it will crash.
If you want to know what missing feature is causing the crash, run yuzu through Terminal. </br>
The situation will get better in the future as MoltenVK adds support for more features.

## Known working games: 
Here is a list of some games that have been tested and go in-game. It is not a complete list, there are probably more that work: 
- Persona 5 Royal
- Return of the Obra Dinn
- Salt & Sanctuary
- Final Fantasy Pixel Remasters
- Hollow Knight

# Credits:

- Yuzu team:

https://github.com/yuzu-emu

(give those dudes a tip here: https://www.patreon.com/yuzuteam)

- Yuzu's macOS build instructios:

https://yuzu-emu.org/wiki/building-for-macos/

...and ChatGPT with GitHub Copilot for making my drunkass shell coding public.

If I get sued by Big N, come visit my grave ^^

![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
