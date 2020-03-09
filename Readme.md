# Typist.pk3

[![Build Status](https://travis-ci.com/mmaulwurff/typist.pk3.svg?branch=master)](https://travis-ci.com/mmaulwurff/typist.pk3)

[Download](http://www.mediafire.com/folder/axlfmgquqize8/Typist.pk3)

[Discord](https://discord.gg/cFpdvWZ)

[Youtube](https://www.youtube.com/playlist?list=PL13LmqbAWk2cE8d3vkG0zDuCiwSVlKtUZ)

[GitHub](https://github.com/mmaulwurff/typist.pk3)

Typist.pk3 is a gameplay mod that turns your game into a typing exercise.

The following Lessons are available:
- 1000 basic English words;
- 1000 most used Russian words;
- Arithmetic;
- C++ Development;
- GZDoom Development;
- Random letters;
- Random numbers;
- Custom text (see below for instructions).

## How To Play

Load it with GZDoom.

There are two game modes: Combat and Exploration. They are switched
automatically.

### Exploration Mode (blue)

Your familiar mode. You can walk, open doors, turn switches, etc.

### Combat Mode (red)

This mode is for fighting enemies. Instead of aiming and shooting, you type
answers for your targets. When the answer is ready, press Space or Enter, or
hold for continuous fire.

- press Ctrl+Backspace to erase the whole answer.
- press Escape to force Exploration mode. After this, you can return to
  automatic mode switching with Unlock Game Mode key assigned in Typist options.

Because you cannot move normally in Combat mode, the following commands are
available:

- `tl` - turn to the left,
- `tr` - turn to the right,
- `dl` - dash to the left,
- `dr` - dash to the right,
- `df` - dash forward,
- `db` - dash backward.

## How To Set Up Custom Text Lesson

1. Find any text or book in ASCII .txt file (UTF-8 may also work).
2. Rename text file to `typist_custom_text.txt`.
3. Load `typist_custom_text.txt` with GZDoom alongside Typist.pk3.
4. Select Custom Text in Typist options menu.

## Incompatible Mods

- Guncaster. Reason: Guncaster reads player input directly from player, so
  weapon firing cannot be emulated like for other mods. Guncaster support cannot
  be added without modifications in Guncaster or GZDoom.
- Guncaster Vindicated. Reason: the same as Guncaster.

## Compilation

Actually, you don't need to compile this. The repository contains everything
that is needed to run this mod. But if you want to develop Typist.pk3 with
maximum comfort, set up the compilation.

### Linux

Required tools:
- Git
- Bash
- Python 3
- pylint3
- aspell with English (UK) dictionaries
- ShellCheck

```
./scripts/build.sh
```

To run tests:
```
./scripts/test.sh
```

(Test script also builds.)

### Windows

It may be possible to compile this on Windows. Install Msys or something. You're on your own :)

## Software Used

- [Emacs](https://www.gnu.org/software/emacs/)
- [Slade](https://github.com/sirjuddington/SLADE)

## Acknowledgments

### Credits

- KeksDose for [libeye](https://forum.zdoom.org/viewtopic.php?f=105&t=64566#p1102157) (Level and screen projections)
- ZippeyKeys12 (Zain Aamer) for [Clematis](https://github.com/ZippeyKeys12/clematis) (Basic ZScript unit test framework for GZDoom). Clematis is under the [BSD 3-Clause License](https://github.com/ZippeyKeys12/clematis/blob/master/LICENSE).
- fraggle for [miniwad.wad](https://github.com/fragglet/miniwad) (BSD license)
- [1000 basic English words](https://en.wiktionary.org/wiki/Appendix:1000_basic_English_words) (tt_1000.txt) (actually, 1008) CC BY-SA 3.0
- [Frequency dictionary of the modern Russian language](https://en.wiktionary.org/wiki/Appendix:Frequency_dictionary_of_the_modern_Russian_language_(the_Russian_National_Corpus)) (tt_1000_ru.txt) CC BY-SA 3.0
- Captain J for sound design. See credits for each sound effect in credits-sounds.md

### Thanks

- LGR for [Sega's Typing of the Dead: A Zombie-Slaying Education](https://youtu.be/iamxvTe9Z5g) video
- Marrub for [ZScript documentation](https://github.com/marrub--/zscript-doc)
- Accensus for inviting into Discord server and for bug reports
- Accensus, Tapwave, and IKA for patience in testing and development of certain
  under-the-hood tech, which is also used in [War Trophies](https://forum.zdoom.org/viewtopic.php?f=43&t=67054#p1132997)
- kadu522 for support
- dard22 for bug reports
- Jarewill for bug reports
