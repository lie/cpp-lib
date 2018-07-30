#!/bin/sh
# generate .fpp file
# argment: hoge.hpp

if [ "$1" = "" ]; then
	echo "No argment" >&2
	exit 1
fi

INCLUDE_DIR=$(cd $(dirname $0); pwd)/../include     # /path/to/repository/include

HPPFILE_NAME=$1                                     # hoge.hpp
MACRO=`echo _${HPPFILE_NAME/./_}_ | tr [a-z] [A-Z]` # _HOGE_HPP_
HPPFILE_PATH=$INCLUDE_DIR/$HPPFILE_NAME             # /path/to/repository/include/hoge.hpp
                                                    # /path/to/repository/srcipt/../include/hoge.hpp (in fact)

if [ -e ${HPPFILE_PATH} ]; then
	echo $0": "${HPPFILE_NAME}" already exists" >&2
	exit 1
fi

echo "#ifndef "${MACRO} >> ${HPPFILE_PATH}
echo "#define "${MACRO} >> ${HPPFILE_PATH}
echo >> ${HPPFILE_PATH}
echo "#include \"alllib.hpp\"" >> ${HPPFILE_PATH}
echo >> ${HPPFILE_PATH}
echo >> ${HPPFILE_PATH}
echo >> ${HPPFILE_PATH}
echo "#endif /* "$MACRO" */" >> ${HPPFILE_PATH}
