# Typist.pk3

[![Build Status](https://travis-ci.com/mmaulwurff/typist.pk3.svg?branch=master)](https://travis-ci.com/mmaulwurff/typist.pk3)

Features nothing at the moment!

# Installation

Run this mod with GZDoom.

# Incompatible mods

- Guncaster. Reason: Guncaster reads player input directly from player, so
  weapon firing cannot be emulated like for other mods. Guncaster support cannot
  be added without modifications in Guncaster or GZDoom.

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

- [Slade](https://github.com/sirjuddington/SLADE)

# Acknowledgments

- KeksDose for [libeye](https://forum.zdoom.org/viewtopic.php?f=105&t=64566#p1102157) (Level and screen projections)

- ZippeyKeys12 (Zain Aamer) for [Clematis](https://github.com/ZippeyKeys12/clematis) (Basic ZScript unit test framework for GZDoom). Clematis is under the [BSD 3-Clause License](https://github.com/ZippeyKeys12/clematis/blob/master/LICENSE).

- Marrub for [ZScript documentation](https://github.com/marrub--/zscript-doc)
- fraggle for [miniwad.wad](https://github.com/fragglet/miniwad) (BSD license)
- kadu522 for support
- [1000 basic English words](https://en.wiktionary.org/wiki/Appendix:1000_basic_English_words) (tt_1000.txt) (actually, 1008) CC BY-SA 3.0
