{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    audacity
    pavucontrol
    tauon
    picard

    ## Utility
    dconf-editor
    gnome-disk-utility
    webcamoid

    kid3

    slack
  ];
}
