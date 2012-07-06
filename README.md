# Magnus emacs env
# version 0.3

# Pkg installed from repo

    python-mode - Python mode for GNU Emacs and XEmacs
    pymacs - interface between Emacs Lisp and Python # it is not el
    python-rope - Python refactoring library
    python-ropemacs - Emacs mode for Python refactoring
    pyflakes - passive checker of Python programs
    pylint - python code static checker and UML diagram generator
    magit - An Emacs interface for Git
    w3m-el - simple Emacs interface of w3m
    
## org-mode

Could be org-mode from pkg, however its very old!

[http://orgmode.org/manual/Installation.html#Installation](http://orgmode.org/manual/Installation.html#Installation)

    ;;org-mode
    (setq load-path (cons "/home/magnus/.emacs.d/plugins/org-7.8.11/lisp" load-path))
    (require 'org-install)

----
    # make make in the org-7.8.11 folder
    make

## ropemode: manually

    install manually from contrib/ropemode-0.2.tar.gz

## dov-view: pdf viewer

    Tassilo Horn recently developed doc-view.el: an Emacs utility for viewing PDF/PS/DVI files in Emacs. 

[http://www.gnu.org/software/emacs/manual/html_node/emacs/Document-View.html](http://www.gnu.org/software/emacs/manual/html_node/emacs/Document-View.html)

Footnotes

[1] gs is a hard requirement. For DVI files, dvipdf or dvipdfm is needed. For OpenDocument and Microsoft Office documents, the unoconv tool is needed.

[2] The needed external tools for the document type must be available, and Emacs must be running in a graphical frame and have PNG image support. If any of these requirements is not fulfilled, Emacs falls back to another major mode.

## auto-complete: manually

    Install by make install:

    magnus@maximus:~/.emacs.d/contrib/auto-complete-1.3.1$ make install DIR=$HOME/.emacs.d/USED/
    emacs -Q -L . -batch -l etc/install /home/magnus/.emacs.d/USED/
    Installing to /home/magnus/.emacs.d/USED/ from /home/magnus/.emacs.d/contrib/auto-complete-1.3.1/
    Wrote /home/magnus/.emacs.d/contrib/auto-complete-1.3.1/auto-complete-config.elc
    Wrote /home/magnus/.emacs.d/contrib/auto-complete-1.3.1/auto-complete.elc
    Wrote /home/magnus/.emacs.d/contrib/auto-complete-1.3.1/fuzzy.elc
    Wrote /home/magnus/.emacs.d/contrib/auto-complete-1.3.1/popup.elc
    Successfully installed!
    
    Add the following code to your .emacs:
    
    (add-to-list 'load-path "/home/magnus/.emacs.d/USED/")
    (require 'auto-complete-config)
    (add-to-list 'ac-dictionary-directories "/home/magnus/.emacs.d/USED//ac-dict")
    (ac-config-default)

## pymacs python plugins

### Configuration

Add to your bash

    PYTHONPATH=$PYTHONPATH:~/.emacs.d/pymacs-plugins
    
I have a demo script ``manglers.py`` from [http://pymacs.progiciels-bpi.ca/Winkler.html](http://pymacs.progiciels-bpi.ca/Winkler.html).

To use the function, type:

    M-x manglers-break-on-whitespace
    
