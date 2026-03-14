<h1 align="center">
   <br>
      NixOS Flake
   <br>
</h1>

# TODO
```sh
# 1. Copy hardware configuration from NixOS installation
cp /etc/nixos/hardware-configuration.nix hosts/${HOST}/hardware-configuration.nix

# 2. Create directories for user data
for dir in ~/Music ~/Documents ~/Pictures/wallpapers/others; do
    mkdir -p "$dir"
done

# 3. Copy wallpapers
cp -r wallpapers/otherWallpaper/gruvbox/* ~/Pictures/wallpapers/others/ && \
    cp -r wallpapers/otherWallpaper/nixos/* ~/Pictures/wallpapers/others/ && \
    ln -sf $PWD/wallpapers/wallpaper.png ~/Pictures/wallpapers/wallpaper

sudo nixos-rebuild switch --flake .#${HOST}
```

# 🗃️ Overview

## 📚 Layout

-   [flake.nix](flake.nix) base of the configuration
-   [hosts](hosts) 🌳 per-host configurations that contain machine specific configurations
    - [desktop](hosts/desktop/) 🖥️ Desktop specific configuration
-   [modules](modules) 🍱 modularized NixOS configurations
    -   [core](modules/core/) ⚙️ Core NixOS configuration
    -   [homes](modules/home/) 🏠 my [Home-Manager](https://github.com/nix-community/home-manager) config
-   [wallpapers](wallpapers/) 🌄 wallpapers collection

## MacOS

For MacOS I'd like to use Stow due to constant issues with Nix sadly.

```sh
brew tap railwaycat/emacsmacport

brew install \
  --cask emacs-mac \
  --cask wezterm \
  git stow asdf yazi zellij helix \
  direnv ripgrep zsh fzf zplug starship \
  yarn typescript-language-server zoxide tailwindcss-language-server \
  font-fira-code-nerd-font

# DOOM Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

stow dotfiles
```

# 👥 Credits

Based on [anddani/nix-home](https://github.com/anddani/nix-home)
