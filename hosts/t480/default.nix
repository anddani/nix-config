{
  inputs,
  username,
  host,
  hostname,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./nixarr.nix
    ./power.nix
    ../../modules/common/nixpkgs.nix
    ../../modules/nixos/bootloader.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/user.nix
    inputs.nixarr.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
  ];

  # user.nix sets fish as the login shell
  programs.fish.enable = true;

  # Intel QuickSync so Jellyfin can hardware-transcode when a client needs it
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        hostname
        ;
    };
    users.${username} = {
      imports = [
        ../../modules/home/common
        inputs.catppuccin.homeModules.catppuccin
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";
      programs.home-manager.enable = true;
    };
    backupFileExtension = "hm-backup";
  };

  # This host is new; the shared system.nix pins 24.05 for the desktop
  system.stateVersion = lib.mkForce "25.11";
}
