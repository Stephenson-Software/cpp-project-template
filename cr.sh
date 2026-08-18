#!/bin/sh

# stop at the first failing command, so a broken build is never followed by a run
set -e

# remove old executable
rm -f ./testing

# compile
make

# run
./testing
