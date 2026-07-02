{
  inputs,
  username,
  host,
  hostname,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.home-manager.nixosModules.home-manager
  ];

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
        ../../modules/home/linux
        inputs.catppuccin.homeModules.catppuccin
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
    backupFileExtension = "hm-backup";
  };

  environment.sessionVariables = {
    FLAKE = "/home/anddani/git/nix-home";
  };

  powerManagement.cpuFreqGovernor = "performance";
}
