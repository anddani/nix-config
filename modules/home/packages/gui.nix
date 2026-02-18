{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    audacity
    pavucontrol
    tauon

    ## Utility
    dconf-editor
    gnome-disk-utility
    webcamoid

    slack
  ];
}
