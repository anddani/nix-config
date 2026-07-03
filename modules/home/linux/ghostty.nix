{ ... }:
{
  programs = {
    # Not used as default terminal
    ghostty = {
      enable = true;
      settings = {
        theme = "Catppuccin Latte";
        cursor-style = "block";
        cursor-style-blink = false;
        shell-integration-features = "no-cursor";
        window-decoration = "none";
        window-theme = "system";
        font-family = "JetBrainsMono Nerd Font";
        font-size = 18;
      };
    };
  };
}
