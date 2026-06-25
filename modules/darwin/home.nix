{
  inputs,
  username,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [
        ./../home/darwin
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
