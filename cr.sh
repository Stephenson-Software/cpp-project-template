#!/bin/sh

# stop at the first failing command, so a broken build is never followed by a run
set -e

# remove old executable
make clean

# compile
make

# run, through the Makefile so the executable name is only ever read from TARGET
make run
