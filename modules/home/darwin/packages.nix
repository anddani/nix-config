{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Dev / language servers (matching the Stow setup that's being replaced)
    typescript-language-server
    sqlite
  ];
}
