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

# 👥 Credits

Based on [anddani/nix-home](https://github.com/anddani/nix-home)
