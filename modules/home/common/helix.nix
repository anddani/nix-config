{ ... }:
{
  programs.helix = {
    enable = true;
  };
  xdg.configFile."helix/config.toml".source = ../../../dotfiles/.config/helix/config.toml;
  xdg.configFile."helix/languages.toml".source = ../../../dotfiles/.config/helix/languages.toml;
}
