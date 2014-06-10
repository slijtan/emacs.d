**Table of Contents** *generated with [autotoc](https://github.com/Wilfred/autotoc)*

- [ag.el](#agel)
  - [Screenshot](#screenshot)
  - [Usage](#usage)
    - [Installation](#installation)
    - [Running a search](#running-a-search)
    - [The results buffer](#the-results-buffer)
    - [Search for files](#search-for-files)
  - [Configuration](#configuration)
    - [Highlighting results](#highlighting-results)
    - [Path to the ag executable](#path-to-the-ag-executable)
    - [Visiting the results](#visiting-the-results)
    - [Hooks](#hooks)
    - [Multiple search buffers](#multiple-search-buffers)
    - [Using with Projectile](#using-with-projectile)
    - [Customising the project root](#customising-the-project-root)
    - [Using ag in elisp functions](#using-ag-in-elisp-functions)
    - [Editing the results inline](#editing-the-results-inline)
  - [Changelog](#changelog)
  - [Alternatives](#alternatives)
  - [Todo](#todo)

# ag.el

A simple ag frontend, loosely based on ack-and-half.el.

## Screenshot

[![screen_thumb](https://f.cloud.github.com/assets/70800/239876/738b5bd8-88d8-11e2-96a1-606e8d17d5ba.png)](https://f.cloud.github.com/assets/70800/239871/d8421a54-88d7-11e2-9cc0-df569b228888.png)

## Usage

### Installation

You can install ag.el from [MELPA](http://melpa.milkbox.net/) or
[Marmalade](http://marmalade-repo.org/packages/ag/0.24). Just
run `M-x package-install RET ag RET`. Functions are autoloaded, so
`(require 'ag)` is unnecessary.

If you want to install it manually, add the following to your
.emacs.d:

    (add-to-list 'load-path "/path/to/ag.el")
    (require 'ag)

### Running a search

You will now have the following interactive commands available for performing
searches:

* `ag`
* `ag-files`
* `ag-regexp`
* `ag-project`
* `ag-project-files`
* `ag-project-regexp`

`*-project` commands automatically choose the directory to search,
automatically detecting git, Subversion and Mercurial project roots.

`*-files` commands allow you to specify a PCRE pattern for files to
search in. By default, ag searches in all files. Note that in both
cases, ag ignores files that are ignored by your VCS (e.g. things
mentioned in .gitignore).

### The results buffer

In the search results buffer, you can move between results by pressing
`n` and `p`, and you can visit the file by pressing `<return>` or
clicking.

You can run the search again by pressing `g`, or close the buffer with `q`.

You can activate `next-error-follow-minor-mode` with `C-c C-f`. With
this minor mode enabled, moving in the results buffer will make Emacs
automatically display the search result at point.

If you've [configured wgrep](#editing-the-results-inline) you can use
`C-c C-p` to make the buffer writable and edit the results inline.

Of course, `C-h m` inside a results buffer witll show all the
keybindings available to you.

### Search for files

`ag` supports an option `-g` that lets you to list file names matching
PCRE patterns. It is analogical to `find`, but comes with all the nice
features of `ag` such as automatically ignoring all the vcs files. You
can search for files matching a pattern using functions

* `ag-dired`
* `ag-dired-regexp`
* `ag-project-dired`
* `ag-project-dired-regexp`

The results are presented as a `dired-mode` buffer. The analogical
interface to `find` in emacs is `find-dired`.

## Configuration

### Highlighting results

ag.el supports highlighting results for ag 0.14 or later. Previous
versions of ag don't support the `--color-match` argument.

If your version of ag is recent enough, you can add highlighting by
adding the following to your Emacs configuration:

    (setq ag-highlight-search t)

### Path to the ag executable

ag.el assumes that the ag executable is in one of the directories on
`exec-path`. Generally, this is sufficient.

However, you may find that you can run ag in a terminal but ag.el
isn't finding the ag executable. This is common on Mac OS X. You'll
need to update `exec-path` to match your terminal. The best way to do
this is to install
[exec-path-from-shell](https://github.com/purcell/exec-path-from-shell)
(available on both [Marmalade](http://marmalade-repo.org/) and
[MELPA](http://melpa.milkbox.net/)).

Alternatively, you can do this yourself by putting the following code
in your Emacs configuration:

    (defun set-exec-path-from-shell-PATH ()
      "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

    This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
      (interactive)
      (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
        (setenv "PATH" path-from-shell)
        (setq exec-path (split-string path-from-shell path-separator))))

    (set-exec-path-from-shell-PATH)

### Visiting the results

By default, ag.el will open results in a different window in the
frame, so the results buffer is still visible. You can override this
so the results buffer is hidden and the selected result is shown in its place:

    (setq ag-reuse-window 't)

### Hooks

ag.el provides `ag-mode-hook` which is run when you start a search.

### Multiple search buffers

Ag.el provides the interactive commands for closing old search
buffers:

* `ag-kill-buffers`
* `ag-kill-other-buffers`

Alternatively, you can make ag.el reuse the same `*ag*` buffer for all
your searches:

    (setq ag-reuse-buffers 't)

### Using with Projectile

[Projectile](https://github.com/bbatsov/projectile) supports ag.el. If
you have Projectile installed, `C-c p A` runs `ag` on your project.

### Customising the project root

By default, `ag-project` and `ag-project-regexp` use the root of the
VCS repo as the directory to search in. You can override this by
setting or customising `ag-project-root-function`.

### Using ag in elisp functions

You can use `ag`, `ag-project` and so on from an elisp
function. `ag/FOO` functions are private and are more likely to
change. Please file a bug if you find a use for internal functions
that you can't do otherwise.

### Editing the results inline

[wgrep](https://github.com/mhayashi1120/Emacs-wgrep) has support for
ag.el. If you install wgrep-ag
([available on MELPA](http://melpa.milkbox.net/?#wgrep-ag)), you can
simply run `wgrep-change-to-wgrep-mode` and edit the `*ag*`
buffer. Press `C-x C-s` when you're done to make the changes to
buffers.

## Changelog

### 0.38

`ag-dired` and `ag-project-dired` should now work on Mac OS X
(previously we assumed xargs supported GNU extensions).

### 0.37

Added `ag-dired` and `ag-project-dired` to search for files matching a
pattern.

### 0.36

Fixed a bug in `ag-regexp` and `ag-project-regexp` due to an internal
API change (`ag/search` now uses keyword arguments).

### 0.35

Added the `ag-files` and `ag-project-files` commands.

Note that the *internal API changed* in this release: `ag/search` now
takes `regexp` as a keyword argument instead of a positional
argument. I'm not aware of any external packages depending on this, so
I'm not incrementing the major version.

### 0.34

Specifying the path as an argument to ag, allowing ag.el to do
searches on Windows.

### 0.33

Fixed a bug with ag.el not searching if `shell-command-switch` had
been modified by the user.

### 0.32

Adding `ag-project-root-function` which allows users to override how
ag.el finds the root of a project.

### 0.31

Ag.el faces (which are `ag-match-face` and `ag-hit-face`x) are defined
with `defface`, so you can use `customize-face` on them.

### 0.30

Improved quoting of arguments passed to ag.

### 0.29

Added customisable variable `ag-reuse-window`. If set to `t` (defaults
to `nil`) then selecting a search result hides the results buffer and
shows the match, rather than using a different window in the frame.

### 0.28

`-project` functions now handle the case of multiple nested VCS
repositories. Ag.el now takes the most deepest subdirectory, so if
`/foo/bar` is a subversion repo that contains a git repo
`/foo/bar/baz`, ag.el will search `/foo/bar/baz`.

### 0.27

Ag.el autopopulates the minibuffer with the text at point, or the
active selection. If this text was read-only, the minibuffer text
would also be read-only. It's now always possible to edit the text in
the minibuffer.

### 0.26

Fixed a crash when refreshing a search buffer by pressing `g`.

### 0.25

Added commands `ag-kill-buffers` and `ag-kill-other-buffers` to
close old search result buffers. Also added a customisable variable
`ag-reuse-buffers` so users can optionally stop ag.el creating
multiple buffers.

### 0.24

Search results buffers now take the form `*ag text:something
dir:~/some/path*`, so new searches will create new buffers.

### 0.23

ag.el now detects the project root for Mercurial repositories in the
`ag-project*` commands.

### 0.22

The keys `n` and `p` now move between matches, similar to the
behaviour of dired.

### 0.21

Added a new face `ag-hit-face` to distinguish from `ag-match-face`.

### 0.20

Fixed `next-error` and `previous-error` not working with ag.el (broken
in v0.18).

### 0.19

`ag` now has a default search term of the symbol at point.

### 0.18

Search results are now highlighted as information, rather than
errors. The ag output is now more consistent with grep.el.

### 0.17

The interactive functions provided by ag.el are now autoloaded.

### 0.16

Removed the unused variable `ag-last-buffer`

### 0.15

Fixed `ag-project` and `ag-project-regexp` not working in buffers that
aren't associated with a specific file, such as dired and magit buffers.

### 0.14

The compilation mode regexp is now more accurate, so you should no
longer get 'compilation-next-error: No error here' when trying to open
a file in the results list.

### 0.13

Current stable ag (0.13.1) doesn't support `--color-match`, ag.el now
only highlights when `ag-highlight-search` is non-nil (the default is nil).

If you're upgrading ag.el and your ag version is 0.14 or higher, you
need to explicitly enable highlighting:

    (setq ag-highlight-search t)

## Alternatives

* There's an ag plugin for helm: https://github.com/syohex/emacs-helm-ag

## Todo

* Remove `*-at-point` commands in favour of always defaulting to the
  symbol at point.
* Add aliases for the old command names to ensure backward
  compatibility.
* Modify `ag-regexp-project-at-point` to quote the default search
  string, otherwise `"foo.bar"` will match other things.
