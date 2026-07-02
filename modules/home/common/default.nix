{ ... }:
{
  # Catppuccin theming: enable, but only where modules opt in explicitly.
  catppuccin.enable = true;
  catppuccin.autoEnable = false;

  imports = [
    ./git.nix
    ./helix
    ./shell.nix
    ./zellij.nix
  ];
}
