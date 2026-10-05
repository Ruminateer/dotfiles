# Editing configs

Config sources live in `chezmoi/`, selected by the root `.chezmoiroot` file.
Stow packages in `stow/` contain relative symlinks to shared source files.

Edit files in `chezmoi/` (or use `chezmoi edit`), then run `chezmoi apply`.
With Stow, edits take effect through the symlinks.

To add a shared config:

1. Run `chezmoi add <path>` on the config in your home directory.
2. Add a relative symlink to its source file in `chezmoi/` in the appropriate
   package under `stow/`.

Keep shared configs free of template syntax. Machine-specific `.tmpl` files
belong in `chezmoi/` only; Stow does not render templates.
