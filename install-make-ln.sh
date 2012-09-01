#!/bin/bash
# 2012/07/06
rm ~/.emacs
rm ~/.emacs.d
path=`pwd`

ln -s $path/dot-emacs ~/.emacs
ln -s $path/dot-emacs.d ~/.emacs.d
ls -la ~ | grep emacs