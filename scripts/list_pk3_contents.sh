#!/bin/bash

find . -name "*.pk3" | while read f; do echo $f; zip -sf $f; echo; done
