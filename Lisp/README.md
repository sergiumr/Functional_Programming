# Editor for programming in lisp

## Emacs

> An extensible, customizable, free/libre text editor -- and more

Check the [official website of GNU Emacs](https://www.gnu.org/software/emacs/).

### Configuration

Emacs is highly customizable. The editor is configured using LISP -- actually
Emacs LISP. Besides being customized using LISP, the editor is a great
environment for developing LISP programs.

Editors like Emacs -- the same goes for VIM -- have a steep learning curves;
that's why I'm providing an initial configuration for emacs: Check .emacs.d directory.

Setup Emacs:

1. Install emacs
    > Check the following [link](https://www.gnu.org/software/emacs/download.html#nonfree)
2. Copy .emacs.d to:
    > For more info check [link](https://www.gnu.org/software/emacs/manual/html_node/efaq-w32/Location-of-init-file.html)
    * Linux based: $HOME
    > cp -R .emacs.d $HOME/

## Keybindings

> For keybindings check [link](https://caiorss.github.io/Emacs-Elisp-Programming/Keybindings.html)

* C-c means 'Control' key and 'c' key
* M-c means 'Alt' key and 'c' key
* \<cr> means 'Enter'

### Short list of keybindings

1. Close Emacs
    > C-x C-c
2. Abord command
    > C-g
3. Save File
    > C-x C-s
4. Open/Create file
    > C-c C-f
5. Split verticaly
    > C-x 3
6. Change Window
    > C-x o
7. Close current Window
    > C-x 0
8. Select text
    > C-space
9. Copy text
    > M-w
10. Paste Text
    > C-y
11. Undo
    > C-_
12. Redo
    > C-x u
13. Move to beginning of a file
    > M-<
14. Move to end of a file
    > M->
15. Search forward
    > C-s
16. Go to the next matching element:
    > C-s C-s
17. Search backward
    > C-r
18. Go to the previous matching element:
    > C-r C-r
19. Move forward a word
    > M-f
20. Move backward a word
    > M-b
21. Make current line as the center of the screen
    > M-I

### Slime -- useful for LISP

1. Open Slime
    > M-x slime\<cr>
2. Evaluate expression \<\<inline>>
    > C-M-x
3. Compile whole buffer (file)
    > M-x slime-eval-buffer

Other Slime functionalities: type M-x slime-.
