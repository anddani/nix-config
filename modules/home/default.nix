{ ... }:
{
  catppuccin.enable = true;
  catppuccin.autoEnable = false;

  imports = [
    ./alacritty.nix
    ./aseprite/aseprite.nix
    ./audacious/audacious.nix
    ./browser.nix
    ./fastfetch/fastfetch.nix
    ./foot.nix
    ./gaming.nix
    ./git.nix
    ./gnome.nix
    ./gtk.nix
    ./helix
    ./nemo.nix
    ./niri
    ./obsidian.nix
    ./packages
    ./retroarch.nix
    ./rmpc.nix
    ./rofi/rofi.nix
    ./scripts/scripts.nix
    ./shell.nix
    ./ssh.nix
    ./swaylock.nix
    ./swaync/swaync.nix
    ./swayosd.nix
    ./vicinae/vicinae.nix
    ./zed.nix
    ./zellij.nix
  ];
}
