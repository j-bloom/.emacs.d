# .emacs.d

### May not be the configs you expected
### This config is setup mainly for JS/Typescript, C/C++ and Go

## How to install and use if you still wanted to try it 
- Remove or rename ".emacs.d" from your home directory `"~/"` and clone repo
- If errors occur when emacs is first opened the following lines in "init.el" may need to be evaluated `C-x C-e` or `C-M-x`
  - `(load "~/.emacs.d/init-packages.el")` on line 49  
  If errors persist then the following 2 lines may need to be evaluated
  - `(use-package all-the-icons)` on line 38
  - `(use-package exec-path-from-shell ...)` lines 40 - 43

Although the errors in emacs will tell you this I hope this makes the install easier.

The rest of the packages should now install from [melpa](https://melpa.org/) and [elpa](https://elpa.gnu.org/) without issue. 
