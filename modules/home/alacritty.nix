{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#040404";
          foreground = "#c5c8c6";
        };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
        };
        size = 18;
      };
      keyboard.bindings = [
        { key = 53; mods = "Shift"; mode = "Vi"; action = "SearchBackward"; }
      ];
      selection.save_to_clipboard = true;
      terminal.shell.program = "${pkgs.zsh}/bin/zsh";
      window = {
        decorations = "full";
        opacity = 1.0;
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
