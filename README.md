# dotfiles

Personal configuration files, usable with [chezmoi](https://www.chezmoi.io/)
or as modules with [GNU Stow](https://www.gnu.org/software/stow/).
They are for personal use and may not be portable.

## Setup with chezmoi

Once these changes are pushed to the repository:

```sh
chezmoi init git@github.com:Ruminateer/dotfiles.git
chezmoi diff
chezmoi apply
```

This clones the repository into `~/.local/share/chezmoi` by default and requires
GitHub SSH access. You can commit and push changes from that checkout.

Chezmoi installs all modules as regular files. Use one manager per target file.
When switching from Stow, first remove its links using `stow -D` from the
checkout that created them, then preview and apply with chezmoi.

## Setup with Stow

Clone the repository and link every module:

```sh
git clone git@github.com:Ruminateer/dotfiles.git
cd dotfiles
mkdir -p "$HOME/.config"
stow -d stow -t "$HOME" git make tmux vim
```

Preview changes with `stow -d stow -n -v -t "$HOME" <module>`.
To remove a module's links, run `stow -d stow -D -t "$HOME" <module>`.

## Repository layout and editing

The real config files live in `chezmoi/`. The root
[`.chezmoiroot`](https://www.chezmoi.io/reference/special-files/chezmoiroot/)
selects that directory as chezmoi's source tree. Shared files are plain configs;
only machine-specific files use `.tmpl` templates.

The `stow/` directory contains the `git`, `make`, `tmux`, and `vim`
packages. Each shared file is a relative symlink to its chezmoi source:

```text
chezmoi/
  dot_config/git/config              # real shared config
stow/
  git/.config/git/config             # -> ../../../../chezmoi/dot_config/git/config
```

Edit the real files in `chezmoi/`, or use `chezmoi edit`, then run
`chezmoi apply`. With Stow,
edits are live through the symlinks. Keep shared files free of template syntax,
because Stow does not render templates.

When adding a shared config, add the plain file under `chezmoi/` using `dot_`
for leading dots, then add a relative file symlink in the appropriate Stow
package. New files added with `chezmoi add` also need a Stow link if they should
be available through both managers. Keep machine-specific templates out of
`stow/`.

If you previously used the root-level Stow packages, unstow them using the old
layout before updating the checkout, then run the new setup command above.
Moving the packages changes the paths that existing Stow links point to.
