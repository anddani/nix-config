{ ... }:
{
  programs.helix = {
    enable = true;
  };
  xdg.configFile."helix/config.toml".source = ../../../dotfiles/helix/config.toml;
  xdg.configFile."helix/languages.toml".source = ../../../dotfiles/helix/languages.toml;
}
