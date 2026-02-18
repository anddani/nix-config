{ ... }:
{
  imports = [
    ./alacritty.nix
    ./aseprite/aseprite.nix # pixel art editor
    ./audacious/audacious.nix # music player
    ./browser.nix # firefox based browser
    ./fastfetch/fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./gaming.nix # packages related to gaming
    ./ghostty/ghostty.nix # terminal
    ./git.nix # version control
    ./gnome.nix # gnome apps
    ./gtk.nix # gtk theme
    ./helix
    ./hyprland # window manager
    ./nemo.nix # file manager
    ./niri
    ./obsidian.nix
    ./packages # other packages
    ./retroarch.nix
    ./rmpc.nix
    ./rofi/rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./ssh.nix # ssh config
    ./superfile/superfile.nix # terminal file manager
    ./swaylock.nix # lock screen
    ./swayosd.nix # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    ./vicinae/vicinae.nix # launcher
    ./waybar # status bar
    ./zed.nix
    ./zsh.nix # shell
  ];
}
