{ ... }:
{
  # Catppuccin theming (the module is imported per-user in modules/darwin/home.nix).
  # Match the Linux home: enable, but only where modules opt in explicitly.
  catppuccin.enable = true;
  catppuccin.autoEnable = false;

  # Only the cross-platform home modules are imported here. The Wayland/Linux
  # specific modules (niri, waybar, rofi, swaync, gaming, foot, …) live in
  # ../default.nix and are intentionally left out on macOS.
  imports = [
    ../git.nix # version control (path made portable, see git.nix)
    ../shell.nix # fish + fzf + starship + zoxide (catppuccin themed)
    ../zellij.nix # terminal multiplexer
    ../helix # editor
    ./ssh.nix # ssh (slim, no systemd ssh-agent)
    ./packages.nix # macOS CLI packages
  ];
}
