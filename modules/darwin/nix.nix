{ ... }:
{
  # Determinate nix handles the nix daemon
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
}
