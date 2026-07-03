{ ... }:
{
  # macOS-only home modules. The cross-platform set (git, shell, zellij,
  # helix, …) comes from ../common, imported by the host next to this.
  imports = [
    ./ssh.nix # ssh (slim, no systemd ssh-agent)
    ./packages.nix # macOS CLI packages
  ];
  xdg.configFile."ghostty/config".source = ../../../dotfiles/.config/ghostty/config;
}
