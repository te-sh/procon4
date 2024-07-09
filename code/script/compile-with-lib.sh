#! /bin/bash

LIB=$(cd $(dirname $0)/../lib; pwd)
CRYSTAL_PATH=`crystal env CRYSTAL_PATH`:$LIB crystal $@
