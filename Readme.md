# Typist.pk3

[![Build Status](https://travis-ci.com/mmaulwurff/typist.pk3.svg?branch=master)](https://travis-ci.com/mmaulwurff/typist.pk3)

Features nothing at the moment!

# Installation

Run this mod with GZDoom.

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

## Acknowledgments

- KeksDose for [libeye](https://forum.zdoom.org/viewtopic.php?f=105&t=64566#p1102157) (Level and screen projections (now with resize handling))

- ZippeyKeys12 (Zain Aamer) for [Clematis](https://github.com/ZippeyKeys12/clematis) (Basic ZScript unit test framework for GZDoom). Clematis is under the [BSD 3-Clause License](https://github.com/ZippeyKeys12/clematis/blob/master/LICENSE).
