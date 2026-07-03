{ ... }:
{
  imports = [
    ../common/nixpkgs.nix
    ./nix.nix
    ./system.nix
    ./homebrew.nix
  ];
}
