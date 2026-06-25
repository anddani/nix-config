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
    let
      # NixOS desktop (Linux)
      linuxUsername = "anddani";
      linuxSystem = "x86_64-linux";
      linuxPkgs = import nixpkgs {
        system = linuxSystem;
        config.allowUnfree = true;
      };

      # macOS laptop (Apple Silicon)
      darwinUsername = "andredanielsson";
      darwinSystem = "aarch64-darwin";
      darwinHostname = "Andres-MacBook-Pro";
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = linuxSystem;
          modules = [ ./hosts/desktop ];
          specialArgs = {
            host = "desktop";
            dexter = linuxPkgs.callPackage ./pkgs/dexter.nix { src = inputs.dexter-src; };
            inherit self inputs;
            username = linuxUsername;
          };
        };
      };

      darwinConfigurations = {
        ${darwinHostname} = inputs.nix-darwin.lib.darwinSystem {
          system = darwinSystem;
          modules = [ ./hosts/macbook ];
          specialArgs = {
            host = "macbook";
            hostname = darwinHostname;
            inherit self inputs;
            username = darwinUsername;
          };
        };
      };
    };
}
