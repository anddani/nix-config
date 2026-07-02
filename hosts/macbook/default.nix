{
  inputs,
  username,
  hostname,
  host,
  ...
}:
{
  imports = [
    ../../modules/darwin
    inputs.home-manager.darwinModules.home-manager
  ];

  networking.hostName = hostname;
  networking.computerName = hostname;

  # The user nix-darwin / Homebrew act on behalf of. Required by recent
  # nix-darwin for any user-scoped option (Homebrew, defaults, etc.).
  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [
        ../../modules/home/common
        ../../modules/home/darwin
        inputs.catppuccin.homeModules.catppuccin
      ];
      home.username = "${username}";
      home.homeDirectory = "/Users/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
    backupFileExtension = "hm-backup";
  };
}
