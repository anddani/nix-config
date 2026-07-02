{ pkgs, ... }:
{
  home.packages = with pkgs; [ zellij ];
  xdg.configFile."zellij/config.kdl".source = ../../../dotfiles/.config/zellij/config.kdl;
  xdg.configFile."zellij/catppuccin/catppuccin.kdl".source = ../../../dotfiles/.config/zellij/catppuccin/catppuccin.kdl;
  xdg.configFile."zellij/catppuccin/catppuccin.yaml".source = ../../../dotfiles/.config/zellij/catppuccin/catppuccin.yaml;
}
