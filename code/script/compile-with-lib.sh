#! /bin/bash

LIB=$(cd $(dirname $0)/../lib; pwd)

ARGS=()
for ARG in $@
do
    if [[ $ARG == *.cr ]]; then
        ARGS+="$(basename $ARG) "
        DIR=$(cd $(dirname $ARG) && pwd)
    else
        ARGS+="$ARG "
    fi
done

cd $DIR
export CRYSTAL_PATH=`crystal env CRYSTAL_PATH`:$LIB
exec crystal ${ARGS[@]}
