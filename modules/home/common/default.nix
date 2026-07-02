{ ... }:
{
  # Catppuccin theming: enable, but only where modules opt in explicitly.
  catppuccin.enable = true;
  catppuccin.autoEnable = false;

  imports = [
    ./git.nix
    ./helix
    ./packages.nix
    ./shell.nix
    ./ssh.nix
    ./zed.nix
    ./zellij.nix
  ];
}
