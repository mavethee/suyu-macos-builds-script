## Skrypt kompilujący port Suyu na systemy macOS

<img src="./assets/icons/suyu.png" width="20%" height="20%" align="right"/> 

#### 🇵🇱 Czytasz polską wersje! Go to the 🇺🇸 English version [here](README.md).

> [!WARNING]
> ~~Ten skrypt jest w celach eksperymentalnych.<br> 
> Nie oczekuj wysokiej kompatybilności, jest to jeden z powodów,
> dlaczego oryginalny projekt nie wydawał tego portu.~~<br>
> Projekt obecnie jest martwy/brakuje mu kluczowych deweloperów, ostatnia [aktualizację](https://www.youtube.com/watch?v=UupnXolCO3E) w sprawie podsumowaną przez Mr Sujano.<br>
> Sudachi script jest WIP jak coś :)

#### Pobierz klikając w przycisk poniżej lub [na stronie z poszczególnymi wersjami skryptu](https://github.com/mavethee/suyu-macos-builds-script/releases) :)

[![Pobierz](https://img.shields.io/badge/Download-v0.0.10-brightgreen)](https://github.com/mavethee/suyu-macos-builds-script/releases/download/0.0.10/build_suyu.sh)

## Użytkowanie:

Po pobraniu, otwórz podwójnym klinięciem i postępuj zgodnie z poleceniami.

Preferowane odpalenie skryptu w katalogu domowym.

#### Sprawdź obecną kompatybilność dla portu na systemy macOS z poszczególnymi aplikacjami [tutaj](./assets/compatibility/compatibility_pl_PL.md).

> [!NOTE]
> W przypadku podstawowej konfiguracji na M1, kompilacja trwa ~6mins (pomiar zawiera również pobieranie potrzebnych plików do kompilacji, zależne od szybkości połączenia)
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
> Plik dziennika znajdziesz w `~/.local/share/suyu/log/suyu_log.txt`!
>
> Sytuacja może ulec zmianie w przyszłości, gdy tylko MoltenVK doda wspracie dla większej ilości funkcji.

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

-   Instrukcje kompilacji Suyu dla systemu macOS dostępnym [tutaj](https://git.suyu.dev/suyu/suyu/wiki/Building-for-macOS)

    ...oraz ChatGPT wraz GitHub Copilot za pomoc w upublicznieniu tego syfu.

-   [@shinra-electric](https://github.com/shinra-electric) za wszelkie poprawki! 🍻

    Jeśli zostanę pozwany przez Big N, zapraszam na mój grób ^^

    ![hippo](https://media.tenor.com/uH3ibKuHMSQAAAAC/anime-citrus.gif)
