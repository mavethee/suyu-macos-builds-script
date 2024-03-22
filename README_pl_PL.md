## Skrypt kompilujący port Suyu na systemy macOS

<img src="./assets/icons/suyu.png" width="20%" height="20%" align="right"/> 

🇵🇱 Czytasz polską wersje! Go to the 🇺🇸 English version [here](README.md).

Ten skrypt pobierze wszystkie potrzebne rzeczy dla portu Suyu na macOS.

Weź pod uwagę, żeby nie nastawiać się na wiele, w obecnym stanie nie jest to w pełni funkcjonalny port. 

[![Pobierz](https://img.shields.io/badge/Download-v0.0.9-brightgreen)](https://github.com/mavethee/suyu-macos-builds-script/releases/download/0.0.9/build_suyu.sh)

## Użytkowanie:

Po pobraniu, otwórz podwójnym klinięciem i postępuj zgodnie z poleceniami.

Preferowane odpalenie skryptu w katalogu domowym.

> [!NOTE]
> W przypadku podstawowej konfiguracji na M1, kompilacja trwa ~4mins (pomiar zawiera również pobieranie potrzebnych plików do kompilacji, zależne od szybkości połączenia)
> W razie problemów z uprawnieniami:
> ```
> chmod +x ./build_suyu.sh
> ```
>
> Obecnie Suyu nie wspiera wielu wymaganych funkcji jak na przykład Geometry Shaders lub Transform Feedback Buffers.
> Jeśli twoja gra używa niewspieranych funkcji, Suyu się scrashuje.
>
> Jeśli chcesz poznać szczegóły na temat crasha danej gry, odpal Suyu za pomocą Terminala:
>
> ```
> /Applications/suyu.app/Contents/MacOS/suyu >> suyu.log
> ```
>
> Jeśli chcesz utworzyć plik dziennika zdarzeń:
> ```
> /Applications/suyu.app/Contents/MacOS/suyu >> suyu.log
> ```
>
> Sytuacja może ulec zmianie w przyszłości, gdy tylko MoltenVK doda wspracie dla większej ilości funkcji.

## Sprawdź obecną kompatybilność:

[Kompatybiliność](./assets/compatibility/compatibility_pl_PL.md)

## Contribution:

### 1. Sklonuj repozytorium:

```sh
git clone https://github.com/mavethee/suyu-macos-builds-script.git
cd suyu-macos-builds-script
```

### 2. Upewnij się że repozytorium jest aktualne:

```sh
git pull origin main
```

### 3. Skopiuj skrypt do swojego katalogu głównego:

```sh
ditto build_suyu.sh $HOME/build_suyu.sh
```

### 4. Nadaj uprawnienia skryptowi:

```sh
chmod +x $HOME/build_suyu.sh
```

### 5. Uruchom skrypt:

```sh
$HOME/build_suyu.sh
```

### 6. Enjoy!

```sh
Notka: Pamiętaj o powtórzeniu kroku drugiego co jakiś czas, aby mieć najaktualniejszy skrypt.
```

## Podziękowania:

-   Suyu's macOS build instructions archived [here](https://web.archive.org/web/20240113191459/https://yuzu-emu.org/wiki/building-for-macos/)

    ...oraz ChatGPT wraz GitHub Copilot za pomoc w upublicznieniu tego syfu.

-   [@shinra-electric](https://github.com/shinra-electric) za wszelkie poprawki do mojego pijackiego kodu! 🍻

    Jeśli zostanę pozwany przez Big N, zapraszam na mój grób ^^

    ![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
