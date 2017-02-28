# Magnus' Emacs Env

![](screenshot.png)

I've been using Emacs for over 10 years now. This's my config file :-) it might be useful for someone.

I'm using:

- OrgMode <http://orgmode.org/>
- Python:
  - jedi <https://github.com/davidhalter/jedi>
  - yasnippet <https://github.com/joaotavora/yasnippet>
  - projectile <https://github.com/bbatsov/projectile>
  - magit <ghttps://github.com/magit/magit>
  
- RNA:
  - sequence alignment with Ralee <http://sgjlab.org/ralee/>
- PDB structure format:
  - pdb-mode <https://github.com/mmagnus/emacs-pdb-mode>
- misc:
  - google-translate <https://github.com/atykhonov/google-translate>
  - powerline <https://github.com/milkypostman/powerline>

Now this repo is after a huge clean up. 

- remove plugins/ (now I'm using the Emacs packaging system)

# To test

    [mm] emacs-env git:(master) ✗ source test.sh
