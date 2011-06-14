#!/bin/bash
SCRIPTPATH=`dirname $0 | xargs readlink -f`
$HOME/utf-x/utfx.sh -Dutfx.test.dir=$SCRIPTPATH/
