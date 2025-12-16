{
  description = "André's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    superfile.url = "github:yorukot/superfile";
    vicinae.url = "github:vicinaehq/vicinae";
    zen-browser.url = "github:0xc000022070/zen-browser-flake/beta";
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      username = "anddani";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/desktop ];
          specialArgs = {
            host = "desktop";
            inherit self inputs username;
          };
        };
      };
    };
}
