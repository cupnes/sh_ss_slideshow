#!/bin/bash

set -ue
# set -uex

make -C scripts clean all
cp scripts/sh_ss_slideshow.{iso,cue} .
make -C scripts clean_all
