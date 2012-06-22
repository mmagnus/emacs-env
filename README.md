# Magnus emacs env
# version 0.1

# Pkg installed from repo

    python-mode - Python mode for GNU Emacs and XEmacs
    pymacs - interface between Emacs Lisp and Python # it is not el
    python-rope - Python refactoring library
    python-ropemacs - Emacs mode for Python refactoring
    pyflakes - passive checker of Python programs
    pylint - python code static checker and UML diagram generator
    magit - An Emacs interface for Git
    w3m-el - simple Emacs interface of w3m

## org-mode: out of order

    org-mode - keep notes, maintain ToDo lists, and do project planning in emac

## ropemode: manually

    install manually from contrib/ropemode-0.2.tar.gz

## dov-view: pdf viewer

    Tassilo Horn recently developed doc-view.el: an Emacs utility for viewing PDF/PS/DVI files in Emacs. 

http://www.gnu.org/software/emacs/manual/html_node/emacs/Document-View.html

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

# TODO CHECK OUT :-)

    oneliner-el - extensions of Emacs standard shell-mode 
    auto-complete-el - intelligent auto-completion extension for GNU Emacs # I have this install manually, see auto-complete
    css-mode - A Cascading Style Sheets (CSS) editing mode for Emacs
    dictem - Dict client for emacs
    dictionary-el - dictionary client for Emacs
    ecb - code browser for Emacs supporting several languages
    edb - database program for GNU Emacs
    eflite - Festival-Lite based emacspeak speech server
    emacspeak - speech output interface to Emacs
    emacspeak-ss - Emacspeak speech servers for several synthesizers
    evernote-mode - Emacs major mode for editing Evernote directly
    git-el - fast, scalable, distributed revision control system (emacs support)
    pyrex-mode - emacs-lisp pyrex-mode for pyrex
    anything-el - open anything / QuickSilver-like candidate-selection framework
    mmm-mode - Multiple Major Mode for Emacs
    windows-el - window manager for GNU Emacs
    
