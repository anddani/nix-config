{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    audacity
    pavucontrol

    ## Utility
    dconf-editor
    gnome-disk-utility

  ];
}
