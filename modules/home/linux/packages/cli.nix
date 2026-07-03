{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    man-pages # extra man pages

    ## Tools / useful cli
    swappy # snapshot editing tool
    woomer

    ## Multimedia
    imv
    mpv

    ## Utilities
    killall
    libnotify
    openssl
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    udiskie # Automounter for removable media
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
    exiftool

    ## For btop
    nvtopPackages.intel

    winetricks
    wineWow64Packages.waylandFull
    wezterm
    inotify-tools
    chromium
    android-studio
    claude-code
  ];

  xdg.configFile."wezterm/wezterm.lua".source = ../../../../dotfiles/.config/wezterm/wezterm.lua;
}
