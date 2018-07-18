#! /bin/bash

DEST="/usr/bin/blinky"

rm ${DEST}
ln -s $(pwd)/blinky.sh ${DEST}
