#! /bin/bash

ARGS=()
for ARG in $@; do
    case $ARG in
    -I*)
        INC=${ARG:2}
        ;;
    *)
        ARGS+=($ARG)
        ;;
    esac
done

if [ -n $INC ]; then
    CRYSTAL_PATH=`crystal env CRYSTAL_PATH`:$INC crystal ${ARGS[*]}
else
    crystal ${ARGS[*]}
fi
