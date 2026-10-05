# dotfiles

Personal configuration files, usable with [chezmoi](https://www.chezmoi.io/)
or as modules with [GNU Stow](https://www.gnu.org/software/stow/).
They are for personal use and may not be portable.

## Setup with chezmoi

```sh
chezmoi init git@github.com:Ruminateer/dotfiles.git
chezmoi diff
chezmoi apply
```

Chezmoi installs all configs as regular files.

## Setup with Stow

Clone the repository and link every module:

```sh
mkdir -p "$HOME/.config"
git clone git@github.com:Ruminateer/dotfiles.git
cd dotfiles/stow
stow --target "$HOME" */
```

Replace `*/` with a package name to install only that package. Remove links with
`stow -D --target "$HOME" <package>`.

Add `--simulate` to preview without changing files and `--verbose` to show
details.

## Switching managers

Use one manager per target file. Preserve any local edits, then remove the
installed files or symlinks you want to switch before following the new
manager's setup above.
