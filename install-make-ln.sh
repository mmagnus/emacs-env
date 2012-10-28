#!/bin/bash
# 2012/07/06
rm ~/.emacs
yes | rm -r ~/.emacs.d
path=`pwd`

ln -s $path/dot-emacs ~/.emacs
ln -s $path/dot-emacs.d ~/.emacs.d
ls -la ~ | grep emacs