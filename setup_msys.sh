#!/bin/bash

DOT_FILES=( .msys .vimrc )

for file in ${DOT_FILES[@]}
do
    ln -sfn $HOME/msys_dot/$file $HOME/$file
done

#echo -e '"set verbosefile=/tmp/vim.log' > ~/test.rc.vim
#echo -e '"set verbose=20' >> ~/test.rc.vim

