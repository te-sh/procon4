#! /bin/bash

LIB=$(cd $(dirname $0)/../lib; pwd)

DIR=$(cd $(dirname $0)/../${SOURCE_DIR}; pwd)

cd $DIR
export CRYSTAL_PATH=`crystal env CRYSTAL_PATH`:$LIB
exec crystalline
