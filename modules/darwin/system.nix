{ pkgs, ... }:
{
  # fish is the interactive shell (configured in modules/home/shell.nix). zsh
  # stays enabled because it's still the macOS login shell — keeping it on means
  # nix paths get sourced before fish is launched.
  programs.fish.enable = true;
  programs.zsh.enable = true;

  # Register fish in /etc/shells so it can be set as a login shell with `chsh`.
  environment.shells = with pkgs; [ fish ];

  environment.systemPackages = with pkgs; [
    coreutils
  ];

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      mru-spaces = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv"; # list view
      ShowPathbar = true;
    };

    NSGlobalDomain = {
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      ApplePressAndHoldEnabled = false;
    };
  };

  # Used for backwards compatibility of nix-darwin. Do not change after the
  # initial install unless you know what you're doing.
  system.stateVersion = 5;
}
