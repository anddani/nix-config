{ ... }:
{
  programs.helix = {
    enable = true;
  };
  xdg.configFile."helix/languages.toml".source = ../../../dotfiles/helix/languages.toml;
}
