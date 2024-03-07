<img src="./assets/icons/yuzu_icon.png" width="20%" height="20%" align="right"/> 

## Skrypt kompilujący port Yuzu na systemy macOS

[🇵🇱 Czytasz polską wersje strony](README_pl_PL.md) [🇺🇸 Go to English version](README.md)

Ten skrypt pobierze wszystkie potrzebne rzeczy dla portu Yuzu na macOS.

Weź pod uwagę, żeby nie nastawiać się na wiele, w obecnym stanie nie jest to w pełni funkcjonalny port. 

Prace na portem na macOS wciąż trwają!

Skrypt bazuje na tym artykule:

https://yuzu-emu.org/wiki/building-for-macos/

## Oficjalne repozytorium Yuzu na GitHubie:

https://github.com/yuzu-emu/yuzu

[![Pobierz](https://img.shields.io/badge/Download-v0.0.6-brightgreen)](https://github.com/mavethee/yuzu-macos-builds-script/releases/download/0.0.6/build_yuzu.sh)

## Użytkowanie:

Po pobraniu, otwórz podwójnym klinięciem i postępuj zgodnie z poleceniami.

Preferowane odpalenie skryptu w katalogu domowym.

> [!NOTE]
> W przypadku podstawowej konfiguracji na M1, kompilacja trwa ~4mins (pomiar zawiera również pobieranie potrzebnych plików do kompilacji, zależne od szybkości połączenia)
> W razie problemów z uprawnieniami:
> ```
> chmod +x ./build_yuzu.sh
> ```

> [!NOTE]
> Obecnie yuzu nie wspiera wielu wymaganych funkcji jak na przykład Geometry Shaders lub Transform Feedback Buffers.
> Jeśli twoja gra używa niewspieranych funkcji, yuzu się scrashuje.
> Jeśli chcesz poznać szczegóły na temat crasha danej gry, odpal Yuzu za pomocą Terminala:
> ```
> /Applications/yuzu.app/Contents/MacOS/yuzu
> ```
> Sytuacja może ulec zmianie w przyszłości, gdy tylko MoltenVK doda wspracie dla większej ilości funkcji.

## Sprawdź obecną kompatybilność:

[Kompatybiliność](./assets/compatibility/compatibility_pl_PL.md)

## Kompilacja:

## 1. Sklonuj repozytorium:

```sh
git clone https://github.com/mavethee/yuzu-macos-builds-script.git
cd yuzu-macos-builds-script
```

## 2. Upewnij się że repozytorium jest aktualne:

```sh
git pull origin main
```

## 3. Skopiuj skrypt do swojego katalogu głównego:

```sh
ditto build_yuzu.sh $HOME/build_yuzu.sh
```

## 4. Nadaj uprawnienia skryptowi:

```sh
chmod +x $HOME/build_yuzu.sh
```

## 5. Uruchom skrypt:

```sh
$HOME/build_yuzu.sh
```

## 6. Enjoy!

Notka: Pamiętaj o powtórzeniu kroku drugiego co jakiś czas, aby mieć najaktualniejszy skrypt. </br>

## Podziękowania:

-   Yuzu's macOS build instructions archived [here](https://web.archive.org/web/20240113191459/https://yuzu-emu.org/wiki/building-for-macos/)

    ...oraz ChatGPT wraz GitHub Copilot za pomoc w upublicznieniu tego syfu.

-   [@shinra-electric](https://github.com/shinra-electric) za wszelkie poprawki do mojego pijackiego kodu! 🍻

    Jeśli zostanę pozwany przez Big N, zapraszam na mój grób ^^

    ![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
