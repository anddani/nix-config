{ ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./flatpak.nix
    ./font.nix
    ./hardware.nix
    ./network.nix
    ../common/nixpkgs.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
