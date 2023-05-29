<img src="https://raw.githubusercontent.com/yuzu-emu/yuzu-assets/master/icons/icon.png" width="10%" height="10%"/> 

## Yuzu's macOS build and compile script:

This script will build and compile Yuzu for macOS.

Remember to not expect miracles, its not ready for end users yet, macOS build is still in development!

This script is based of build instructions:
https://yuzu-emu.org/wiki/building-for-macos/

## Original Yuzu's repository:

https://github.com/yuzu-emu/yuzu

# Instructions:

## 1. Clone the repository (or Code -> Download ZIP)

```
$HOME && git clone https://github.com/mavethee/yuzu-macos-builds-script.git && cd yuzu-macos-builds-script
```

## 2. Make sure cloned repo is up to date!

```
cd $HOME/yuzu-macos-builds-script && git pull origin main
```

## 3. Move both scripts preferably to $HOME directory

```
mv install_yuzu.sh $HOME && mv run_yuzu.sh $HOME
```

## 4. Make both scripts executable

```
chmod +x $HOME/install_yuzu.sh && chmod +x $HOME/run_yuzu.sh
```

## 5. Run install_yuzu.sh

```
$HOME/install_yuzu.sh
```

## 6. Run run_yuzu.sh

```
$HOME/run_yuzu.sh
```

## 7. Enjoy!

Note: Remember to repeat STEP 2 for eventual script changes, most of Yuzu's GUI crashes for now, you can't switch to controller or change default settings being stuck to keyboard controls listed below:

<img src="https://media.discordapp.net/attachments/724306793819275309/1111011104810877029/image.png"/> 

# Credits:

- Yuzu team:

https://github.com/yuzu-emu

(give those dudes a tip here: https://www.patreon.com/yuzuteam)

- Yuzu's macOS build instructios:

https://yuzu-emu.org/wiki/building-for-macos/

...and ChatGPT with GitHub Copilot for making my drunkass shell coding public.

If I get sued by Big N, come visit my grave ^^

![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
