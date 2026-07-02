{ pkgs, ... }:
{
  gtk = {
    enable = true;
    font = {
      name = "Ubuntu";
      size = 12;
    };
    gtk3.extraConfig = {
      gtk-monospace-font-name = "JetBrainsMono Nerd Font Mono 11";
    };
    gtk4.extraConfig = {
      gtk-monospace-font-name = "JetBrainsMono Nerd Font Mono 11";
    };
    theme = {
      name = "Colloid-Green-Dark-Gruvbox";
      package = pkgs.colloid-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "green" ];
        tweaks = [
          "gruvbox"
          "rimless"
          "float"
        ];
      };
    };
    gtk4.theme = null;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override { color = "green"; };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
