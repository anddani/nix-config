{
  description = "André's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # macOS (nix-darwin) support
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Declarative Homebrew installation for nix-darwin
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    # Media server (Jellyfin + *arr apps) for the t480
    nixarr = {
      url = "github:nix-media-server/nixarr";
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

    vicinae.url = "github:vicinaehq/vicinae";
    zen-browser.url = "github:0xc000022070/zen-browser-flake/beta";

    elixir-overlay.url = "github:zoedsoupe/elixir-overlay";
    magi.url = "github:anddani/magi";
    catppuccin.url = "github:catppuccin/nix";

    dexter-src = {
      url = "github:remoteoss/dexter/main";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/desktop ];
          specialArgs = {
            inherit self inputs;
            host = "desktop";
            hostname = "desktop";
            username = "anddani";
          };
        };

        t480 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/t480 ];
          specialArgs = {
            inherit self inputs;
            host = "t480";
            hostname = "t480";
            username = "anddani";
          };
        };
      };

      darwinConfigurations = {
        mac = inputs.nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [ ./hosts/macbook ];
          specialArgs = {
            inherit self inputs;
            host = "macbook";
            hostname = "Andres-MacBook-Pro";
            username = "andredanielsson";
          };
        };
      };
    };
}
