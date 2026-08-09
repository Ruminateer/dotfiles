# dotfiles

Personal configuration files, managed as modules with [GNU Stow](https://www.gnu.org/software/stow/).
They are for personal use and may not be portable.

## Setup

Clone the repository and link every module:

```sh
git clone https://github.com/Ruminateer/dotfiles.git
cd dotfiles
stow -t "$HOME" fish git make vim
```

Preview changes with `stow -n -v -t "$HOME" <module>`.
To remove a module's links, run `stow -D -t "$HOME" <module>`.
