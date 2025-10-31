{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      c = "clear";
      cd = "z";
      diff = "delta --diff-so-fancy --side-by-side";
      copy = "wl-copy";
      f = "superfile";
      dsize = "du -hs";
      open = "xdg-open";

      l = "eza --icons -a --group-directories-first -1 --no-user --long"; # EZA_ICON_SPACING=2
      tree = "eza --icons --tree --group-directories-first";
    };
  };
}
