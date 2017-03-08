# Magnus' Emacs Env

![](screenshot.png)

I've been using Emacs for over 10 years now. This's my config file :-) it might be useful for someone.

I'm using:

- `OrgMode` <http://orgmode.org/>
- Python:
  - ``python.el`` (is now distributed with Emacs;) but switching between this and ``python-mode.el`` <https://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl>
  - ``jedi`` <https://github.com/davidhalter/jedi>
  - ``yasnippet`` <https://github.com/joaotavora/yasnippet>
  - ``projectile`` <https://github.com/bbatsov/projectile>
  - ``magit`` <https://github.com/magit/magit>
- R
  - Emacs Speaks Statistics (``ess``) <https://ess.r-project.org/>
- RNA:
  - sequence alignment with ``Ralee`` <http://sgjlab.org/ralee/>
- PDB structure format:
  - `pdb-mode` <https://github.com/mmagnus/emacs-pdb-mode>
- misc:
  - `google-translate` <https://github.com/atykhonov/google-translate>
- theme
  - `powerline` <https://github.com/milkypostman/powerline>

Now this repo is after a huge clean up. 

- remove plugins/ (now I'm using the Emacs packaging system)

# Useful links

https://www.emacswiki.org/emacs/PythonProgrammingInEmacs

# Install

    pip install jedi epc pylint 

# To test

    [mm] emacs-env git:(master) ✗ source test.sh

# Read more

- https://www.emacswiki.org/emacs/ProgrammingWithPythonDotElGallina
- https://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl watch http://www.youtube.com/watch?v=0cZ7szFuz18

# Inspired
by similar repos:

- http://www.enigmacurry.com/2008/05/09/emacs-as-a-powerful-python-ide/# 
- https://github.com/jhamrick/emacs

# History

- 170308 add emacs & ipython notebook https://github.com/tkf/emacs-ipython-notebook
- 170308 recover old python-outline! It does exactly what I want.. I can't use py-hide etc.
