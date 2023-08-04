<img src="https://raw.githubusercontent.com/yuzu-emu/yuzu-assets/master/icons/icon.png" width="10%" height="10%"/> 

## Skrypt kompilujący port Yuzu na systemy macOS

[🇵🇱 Czytasz polską wersje strony](README_pl_PL.md) [🇺🇸 Go to English version](README.md)

Ten skrypt pobierze wszystkie potrzebne rzeczy dla portu Yuzu na macOS.

Weź pod uwagę, żeby nie nastawiać się na wiele, w obecnym stanie nie jest to w pełni funkcjonalny port. 

Prace na portem na macOS wciąż trwają!

Skrypt bazuje na tym artykule:

https://yuzu-emu.org/wiki/building-for-macos/

## Oficjalne repozytorium Yuzu na GitHubie:

https://github.com/yuzu-emu/yuzu

[![Pobierz](https://img.shields.io/badge/Download-v0.0.1-brightgreen)](https://github.com/mavethee/yuzu-macos-builds-script/releases/download/0.0.1/build_yuzu.sh)

## Użytkowanie:

Po pobraniu, otwórz podwójnym klinięciem i postępuj zgodnie z poleceniami.

Preferowane odpalenie skryptu w katalogu domowym.

Na podstawowej konfiguracji z M1, kompilowanie trwa ~4 minuty (pomiar wraz z pobieraniem potrzebnych programów, zależne od twojego połączenia internetowego).

Wrazie problemów z uprawnieniami:

```
chmod +x ./build_yuzu.sh
```

Obecnie yuzu nie wspiera wielu wymaganych funkcji jak na przykład Geometry Shaders lub Transform Feedback Buffers.</br>
Jeśli twoja gra używa niewspieranych funkcji, yuzu się scrashuje.
Jeśli chcesz poznać szczegóły na temat crasha danej gry, odpal Yuzu za pomocą Terminala: </br>

```
/Applications/yuzu.app/Contents/MacOS/yuzu
```

Sytuacja może ulec zmianie w przyszłości, gdy tylko MoltenVK doda wspracie dla większej ilości funkcji.

## Sprawdź obecną kompatybilność:

[Kompatybiliność](Compatibility_pl_PL.md)

## Kompilacja:

## 1. Sklonuj repozytorium:

```
git clone https://github.com/mavethee/yuzu-macos-builds-script.git
cd yuzu-macos-builds-script
```

## 2. Upewnij się że repozytorium jest aktualne:

```
git pull origin main
```

## 3. Skopiuj skrypt do swojego katalogu głównego:

```
ditto build_yuzu.sh $HOME/build_yuzu.sh
```

## 4. Nadaj uprawnienia skryptowi:

```
chmod +x $HOME/build_yuzu.sh
```

## 5. Uruchom skrypt:

```
$HOME/build_yuzu.sh
```

## 6. Enjoy!

Notka: Pamiętaj o powtórzeniu kroku drugiego co jakiś czas, aby mieć najaktualniejszy skrypt. </br>

## Podziękowania:

- Yuzu team:

    https://github.com/yuzu-emu

    (🍺 Postawcie im piwo: https://www.patreon.com/yuzuteam)

- Instrukcje kompilacji projektu na macOS:

    https://yuzu-emu.org/wiki/building-for-macos/

    ...i ChatGPT wraz z GitHub Copilot za umożliwienie publikacji mojego pijackiego kodu.

    Jeśli zostanę pozwany przez Big N, zapraszam na mój grób ^^

    ![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
