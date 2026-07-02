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
    - [desktop](hosts/desktop/) 🖥️ Desktop specific configuration (NixOS)
    - [macbook](hosts/macbook/) 💻 MacBook specific configuration (nix-darwin)
-   [modules](modules) 🍱 modularized configurations
    -   [nixos](modules/nixos/) ⚙️ NixOS system configuration
    -   [darwin](modules/darwin/) 🍎 nix-darwin system configuration
    -   [home](modules/home/) 🏠 my [Home-Manager](https://github.com/nix-community/home-manager) config
        -   [common](modules/home/common/) shared across all machines (shell, git, editors, terminal tools)
        -   [linux](modules/home/linux/) Linux-only (niri, waybar-era Wayland tooling, GUI apps)
        -   [darwin](modules/home/darwin/) macOS-only extras
-   [wallpapers](wallpapers/) 🌄 wallpapers collection

## macOS (nix-darwin + home-manager)

The Mac is managed declaratively with [nix-darwin](https://github.com/nix-darwin/nix-darwin)
and [home-manager](https://github.com/nix-community/home-manager). GUI apps are installed as
Homebrew casks driven by [nix-homebrew](https://github.com/zhaofengli/nix-homebrew).

```sh
# 1. Install Nix (Determinate installer — flakes enabled by default).
#    Open a NEW terminal afterwards so the daemon is on PATH.
curl -fsSL https://install.determinate.systems/nix | sh -s -- install

# 2. Bootstrap nix-darwin (darwin-rebuild doesn't exist yet, so run it via nix).
sudo nix run github:nix-darwin/nix-darwin/master#darwin-rebuild -- \
    switch --flake ~/git/nix-config#Andres-MacBook-Pro
#    If it complains that /etc/zshrc (or /etc/bashrc) already exists:
#      sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
#    then re-run the command. The first run also installs Homebrew + casks.

# 3. Apply changes on every subsequent edit.
sudo darwin-rebuild switch --flake ~/git/nix-config#Andres-MacBook-Pro

# 4. Set fish as the login shell (one-time). The rebuild registers fish in
#    /etc/shells via `environment.shells`, so chsh will accept it.
chsh -s /run/current-system/sw/bin/fish
#    Open a new terminal afterwards. fish is configured in modules/home/common/shell.nix.
```

> Note: the Determinate installer ships *Determinate Nix*, which manages the Nix daemon
> itself, so the darwin config sets `nix.enable = false` (see
> [modules/darwin/nix.nix](modules/darwin/nix.nix)). Add GUI apps by editing the `casks`
> list in [modules/darwin/homebrew.nix](modules/darwin/homebrew.nix).

# 👥 Credits

Based on [anddani/nix-home](https://github.com/anddani/nix-home)
