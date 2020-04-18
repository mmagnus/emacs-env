<h1 align="center">Magnus' Emacs Env</h1>

<p align="center"><b>Emacs is my rifle. There are many editors like it, but this one is mine. </br>Without me, my rifle is useless. Without my rifle, I am useless.</b></p>

![](screenshot.png)
Fig. Python Mode (python-outline - old)

</hr>

![](screenshot2.png)

Fig. Geekbook (Markdown) + Jupyter (IPython notebook)

I've been using Emacs for over 10 years now. This's my config file :-) it might be useful for someone.

I'm using:

- `OrgMode` <http://orgmode.org/>
- `Markdown mode` https://jblevins.org/projects/markdown-mode/ with https://github.com/mooreryan/markdown-dnd-images
- `Darkroom mode` https://github.com/joaotavora/darkroom
- Python:
  - `python-mode.el` <https://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl>
  - `pytest` https://github.com/ionrock/pytest-el
  - `flycheck` (including `pylint`) On the fly syntax checking for GNU Emacs <https://github.com/flycheck/flycheck>
  - `jedi` autocompletion and static analysis library for python <https://github.com/davidhalter/jedi>
  - `yasnippet` snippets <https://github.com/joaotavora/yasnippet>
  - `projectile` <https://github.com/bbatsov/projectile>
  - `magit` git in Emacs <https://github.com/magit/magit>
  - `sphinx-doc` Generate Sphinx friendly docstrings for Python functions in Emacs  <https://github.com/naiquevin/sphinx-doc.el>
  - `sphinx-frontend` provides a simple way to find closest Sphinx configuration file (conf.py)
and run the Sphinx. <https://github.com/kostafey/sphinx-frontend>
  - `ido-vertical-mode` <https://github.com/creichert/ido-vertical-mode.el>
  - debugging with `realgud` <https://github.com/realgud/realgud>

- SoftDev
    - sometimes I'm switch on `speedbar` (`sr-speedbar`) <https://www.emacswiki.org/emacs/SrSpeedbar> but I think I prefere usually to keep it off because it cluters the frame.    SrSpeedbar is a mode that makes SpeedBar show in the Current Frame, by SebastianRose.
- R
  - Emacs Speaks Statistics (`ess`) <https://ess.r-project.org/>
- RNA:
  - sequence alignment with `Ralee` <http://sgjlab.org/ralee/>
- PDB structure format:
  - `pdb-mode` <https://github.com/mmagnus/emacs-pdb-mode>
- writing: papers, reports, notes:
  - `google-translate` <https://github.com/atykhonov/google-translate>
- theme
  - `powerline` <https://github.com/milkypostman/powerline>

# Screens
sphinx-doc <https://github.com/naiquevin/sphinx-doc.el>

    C-c M-d # generate docstring for a given function

![](docs/pngs/EoN45lmSXj.gif)

# Install

    pip install jedi epc pylint

# To test

    [mm] emacs-env git:(master) ✗ source test.sh

# Learn EMACS for Python

Andrea Crotti - Emacs and shell as your best friend /EuroPython 2013/ https://www.youtube.com/watch?v=0cZ7szFuz18 https://github.com/AndreaCrotti/minimal-emacs-configuration

Emacs as a Python IDE (package.el, jedi, auto-complete, projectile, sandbox as a vm) - https://www.youtube.com/watch?v=6BlTGPsjGJk and the repo for the talk <https://github.com/wernerandrew/jedi-starter>. Some lisp on the screen for configuration of jedi.

# Read more
- https://www.emacswiki.org/emacs/PythonProgrammingInEmacs
- https://www.emacswiki.org/emacs/ProgrammingWithPythonDotElGallina
- https://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl watch http://www.youtube.com/watch?v=0cZ7szFuz18

# Inspired by
similar repos:

- http://www.enigmacurry.com/2008/05/09/emacs-as-a-powerful-python-ide/#
- https://github.com/jhamrick/emacs

# Tips

Specific mode oriented keybindings:

    (eval-after-load 'python-mode
    '(define-key python-mode-map (kbd "<f8>") 'python-add-breakpoint))

Python mode keep windows intact:

    '(py-keep-windows-configuration t)


The newest markdown-mode introduced `markdown-max-image-size` for resizing large images. It does the job! Emacs has to be compiled with ImageMagick support (`--with-imagemagick`). Read more https://emacs.stackexchange.com/questions/33952/iimage-mode-resize-an-image-in-markdown-mode-to-fit-the-window

# Keybindings


    shell (term) \C-xt
    emacs-lisp-mode: add C-c C-c (like with Python) and C-c r for eval-buffer and eval-region

    Writing:
    C-c D  turn on darkroom-mode

    python-mode: python-outline Toggle entry is bound to C-c C-e, Toggle all is bound to C-c C-a, Show classes and defs only C-c o
    python-mode:
      C-c u uncomment
      C-c # comment
    sphinx-doc: C-c M-d
    sphinx-frontend:
    C-c h   sphinx-build-html   Compile rst files to html via sphinx
    C-c l   sphinx-build-latex  Compile rst files to latex
    C-c p   sphinx-run-pdflatex     Ad-hoc call pdflatex for LaTeX-builded documentation
    magit: C-c g
    shell (ansi-terminal): C-c m

    # langtool
    \C-c4w langtool-check
    \C-c4W langtool-check-done
    \C-c4l langtool-switch-default-language
    \C-c44 langtool-show-message-at-point
    \C-c4c langtool-correct-buffer

    # pycoverge
    \C-cc pycoverage-refresh

    # pytest
    \C-ca pytest-all
    \C-cm pytest-module
    \C-c. pytest-one
    \C-cd pytest-directory
    \C-cpa pytest-pdb-all
    \C-cpm pytest-pdb-module
    \C-cp. pytest-pdb-one

    dnd() turn on markdown drag and drop
    C-x n n narrow text
    C-x n w widen text

# If you want to use VI in your Emacs ;-)

Evil Mode: Or, How I Learned to Stop Worrying and Love Emacs. Aaron Bieber from Wayfair is back to talk to us about his recent experience using Emacs (what?!?!). That's right, Emacs. Aaron decided it was time to see how things looked on the other side and will share what he found, what he missed from Vim, and maybe even a few things we can bring back to Vim from Emacs. <https://www.youtube.com/watch?v=JWD1Fpdd4Pc>

# Learn more:

- write your own snippets for yasnippet http://longhorizon.org/blog/2013/03/31/improving-python-development-in-emacs-with-yasnippet/

# History

- 170825 My first YASnippet! :-)
- 170318 sphinx-doc, sphinx-frontend, sphinx-mode
- 170308 add emacs & ipython notebook https://github.com/tkf/emacs-ipython-notebook
- 170308 recover old python-outline! It does exactly what I want.. I can't use py-hide etc.
- 170228  Now this repo is after a huge clean up. Remove plugins/ (now I'm using the Emacs packaging system).
- 07XXXX I started using Emacs, in the 3rd year of my studies, "forced" by Dr. Murzyn (thank you!)(http://bioinfo.mol.uj.edu.pl/modmol/People/KrzysztofMurzyn)
