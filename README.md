# Dotfiles

My personal configuration files for Linux environments. Managed and deployed using [chezmoi](https://www.chezmoi.io/).

## Quick Start (New Machine)

To apply these configurations to a new machine, run:

```bash

chezmoi init 'https://github.com/anx436/dotfiles'   
chezmoi apply

```

## How it's Managed

Instead of manually symlinking files, Chezmoi tracks the state of my dotfiles and applies them to my home directory.

### Bulk Importing
I maintain a `dots.txt` file containing the paths of all my tracked configs. To sync everything into the source directory at once, I use:

```bash

cat dots.txt | xargs chezmoi add

```

This command automatically pulls the latest versions of the files in `dots.txt` into the Chezmoi source state.

## OS checks

This setup uses OS checks to sync only the files relevant to your current platform:

On Windows: It ignores all Linux-specific config files.
On Linux: It ignores all Windows-specific config files.

```bash

if eq .chezmoi.os "windows"
if eq .chezmoi.os "linux"

```

## Configuration files for:

| Category | Tools |
| :--- | :--- |
| **Shells** | `zsh`, `fish`, `bash`, `pwsh` |
| **Window Managers** | `sway` |
| **Terminals** | `kitty` |
| **Editors** | `Neovim` |
| **File Managers** | `lf`, `ranger` |
| **Bars/Menus** | `polybar`, `waybar`, `rofi`, `dunst` |
| **Media/PDF** | `mpv`, `sioyek`, `zathura` |
