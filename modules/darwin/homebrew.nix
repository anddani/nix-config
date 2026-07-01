{ inputs, username, ... }:
{
  imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];

  nix-homebrew = {
    enable = true;
    user = username;
    enableRosetta = false;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
    # Make the tap directories immutable so they always match the flake.
    mutableTaps = false;
  };

  # GUI apps and anything that doesn't package well in nixpkgs go here as casks.
  # Add more by name (search at https://formulae.brew.sh/cask/).
  homebrew = {
    enable = true;

    # Keep the tap list in sync with nix-homebrew above.
    taps = [
      "homebrew/homebrew-core"
      "homebrew/homebrew-cask"
    ];

    brews = [];
    casks = [
      "wezterm"
      "obsidian"
      "rectangle"
      "claude-code"
    ];

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
