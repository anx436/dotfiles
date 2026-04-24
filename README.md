# Dotfiles

My personal configuration files for Linux environments. Managed and deployed using [chezmoi](https://www.chezmoi.io/).

## Quick Start (New Machine)

To apply these configurations to a new machine, ensure `curl` or `wget` is installed and run:

```bash
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply anx436
```

## How it's Managed

I use **Chezmoi** to handle the heavy lifting. Instead of manually symlinking files, Chezmoi tracks the state of my dotfiles and applies them to my home directory.

### Bulk Importing
To keep things simple, I maintain a `dots.txt` file containing the paths of all my tracked configs. To sync everything into the source directory at once, I use:

```bash
cat dots.txt | xargs chezmoi add
```

This command automatically pulls the latest versions of the files in `dots.txt` into the Chezmoi source state.

## Configuration files for:

| Category | Tools |
| :--- | :--- |
| **Shells** | `zsh`, `fish`, `bash` |
| **Window Managers** | `i3`, `sway` |
| **Terminals** | `kitty` |
| **Editors** | `Neovim` |
| **File Managers** | `lf`, `ranger` |
| **Bars/Menus** | `polybar`, `waybar`, `rofi`, `dunst` |
| **Media/PDF** | `mpv`, `sioyek`, `zathura` |
