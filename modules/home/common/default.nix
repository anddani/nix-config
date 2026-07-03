{ ... }:
{
  # Catppuccin theming: enable, but only where modules opt in explicitly.
  catppuccin.enable = true;
  catppuccin.autoEnable = false;

  imports = [
    ./dev.nix
    ./git.nix
    ./helix.nix
    ./packages.nix
    ./shell.nix
    ./ssh.nix
    ./zed.nix
    ./zellij.nix
  ];
}
