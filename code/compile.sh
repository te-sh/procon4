#! /bin/bash

source .bashrc

fn=$(basename $1)
dn=$(dirname $1)

cd $dn
CRYSTAL_PATH=`crystal env CRYSTAL_PATH`:/code/lib crystal build -o a.out $fn
