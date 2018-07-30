#!/bin/sh

if [ "$1" = "" ]; then
	echo "No argment" >&2
	exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

LIBRARY=${1%.hpp} # remove extention just in case
CPPFILE=${LIBRARY}".cpp"
HPPFILE=${LIBRARY}".hpp"

$SCRIPT_DIR/cpp.sh ${CPPFILE}
$SCRIPT_DIR/hpp.sh ${HPPFILE}
