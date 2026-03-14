{ pkgs, ... }:
{
  home.packages = with pkgs; [ zed-editor ];

  xdg.configFile."zed/settings.json".source = ../../dotfiles/.config/zed/settings.json;
  xdg.configFile."zed/keymap.json".source = ../../dotfiles/.config/zed/keymap.json;
}
