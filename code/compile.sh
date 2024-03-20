#! /bin/bash

source .bashrc

fn=$(basename $1)
dn=$(dirname $1)

cd $dn
crystal build -o a.out $fn --static
