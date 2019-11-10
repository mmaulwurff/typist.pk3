# Typist.pk3

[![Build Status](https://travis-ci.com/mmaulwurff/typist.pk3.svg?branch=master)](https://travis-ci.com/mmaulwurff/typist.pk3)

[Download](http://www.mediafire.com/folder/axlfmgquqize8/Typist.pk3)

[Discord](https://discord.gg/cFpdvWZ)

[Youtube](https://www.youtube.com/playlist?list=PL13LmqbAWk2cE8d3vkG0zDuCiwSVlKtUZ)

[GitHub](https://github.com/mmaulwurff/typist.pk3)

Typist.pk3 is a gameplay mod that turns your game into a typing exercise.

The following exercises (or challenges are available):
- 1000 basic English words;
- Arithmetic;
- C++ Development;
- GZDoom Development;
- Random letters;
- Random numbers.

# How to play

1. Load it with GZDoom.

2. There are two game modes: Combat and Exploration. They are switched
   automatically.

2.1. Exploration mode is your familiar mode. You can walk,
     interact with doors, explore the map.

2.2. Combat mode is for fighting enemies. Here, instead of aiming and shooting,
     you type answers for your targets. When the answer is ready, press Enter,
     and it is applied to the matching targets. Hold Enter for continuous fire.

2.2.1. Press Ctrl+Backspace to erase the whole answer.

3. If you find yourself in a situation when you'd rather walk away from a fight,
   use /explore command - type it instead of an answer. This will lock you in
   Exploration mode until Unlock Game Mode with a bound key.

3.1. There are other commands, too: /left and /right. Use them to turn left and
     right in Combat mode.

# Incompatible mods

- Guncaster. Reason: Guncaster reads player input directly from player, so
  weapon firing cannot be emulated like for other mods. Guncaster support cannot
  be added without modifications in Guncaster or GZDoom.
- Guncaster Vindicated. Reason: the same as Guncaster.

# Compilation

Actually, you don't need to compile this. The repository contains everything
that is needed to run this mod. But if you want to develop Typist.pk3 with
maximum comfort, set up the compilation.

## Linux

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

## Windows

It may be possible to compile this on Windows. Install Msys or something. You're on your own :)

# Software Used

- [Emacs](https://www.gnu.org/software/emacs/)
- [Slade](https://github.com/sirjuddington/SLADE)

# Acknowledgments

- LGR for [Sega's Typing of the Dead: A Zombie-Slaying Education](https://youtu.be/iamxvTe9Z5g) video
- KeksDose for [libeye](https://forum.zdoom.org/viewtopic.php?f=105&t=64566#p1102157) (Level and screen projections)
- ZippeyKeys12 (Zain Aamer) for [Clematis](https://github.com/ZippeyKeys12/clematis) (Basic ZScript unit test framework for GZDoom). Clematis is under the [BSD 3-Clause License](https://github.com/ZippeyKeys12/clematis/blob/master/LICENSE).
- Marrub for [ZScript documentation](https://github.com/marrub--/zscript-doc)
- fraggle for [miniwad.wad](https://github.com/fragglet/miniwad) (BSD license)
- [1000 basic English words](https://en.wiktionary.org/wiki/Appendix:1000_basic_English_words) (tt_1000.txt) (actually, 1008) CC BY-SA 3.0
- [Frequency dictionary of the modern Russian language](https://en.wiktionary.org/wiki/Appendix:Frequency_dictionary_of_the_modern_Russian_language_(the_Russian_National_Corpus)) (tt_1000_ru.txt) CC BY-SA 3.0

# Thanks

- Accensus for inviting me into Discord server
- kadu522 for support
- dard22 for bug reports
