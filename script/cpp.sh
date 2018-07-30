#!/bin/sh
# cpp ファイルを作成

if [ "$1" = "" ]; then
	echo "$0"": No argment" >&2
	exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)     # /path/to/repository/srcipt
INCLUDE_DIR=$SCRIPT_DIR/../include      # /path/to/repository/script/../include
SRC_DIR=$SCRIPT_DIR/../src              # /path/to/repository/srcipt/../src

CPPFILE_NAME=$1                         # hoge.cpp
HPPFILE_NAME=${CPPFILE_NAME%.cpp}".hpp" # hoge.hpp
CPPFILE_PATH=$SRC_DIR/$1                # /path/to/repository/src/hoge.cpp
                                        # /path/to/repository/srcipt/../src/hoge.cpp (in fact)

if [ -e ${CPPFILE_PATH} ]; then
	read -p $0": "${CPPFILE_NAME}" already exists. Overwrite? [Y/n]: " ANSWER
	case $ANSWER in
		"Y" | "y" | "yes" | "Yes" | "YES" )
			> ${CPPFILE_PATH}
			break;;
		* )
			echo "Cancel"
			exit;;
	esac
fi

echo "/*" >> ${CPPFILE_PATH}
echo " *  " >> ${CPPFILE_PATH}
echo " */" >> ${CPPFILE_PATH}
echo >> ${CPPFILE_PATH}
echo "#include \"alllib.hpp\"" >> ${CPPFILE_PATH}
echo "#include \""${HPPFILE_NAME}"\"" >> ${CPPFILE_PATH}
echo >> ${CPPFILE_PATH}
