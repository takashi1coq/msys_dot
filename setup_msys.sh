#!/bin/bash

DOT_FILES=( .msys .vimrc )

for file in ${DOT_FILES[@]}
do
    ln -sfn $HOME/msys_dot/$file $HOME/$file
done
