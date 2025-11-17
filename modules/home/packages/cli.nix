{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    eza                               # ls replacement
    fd                                # find replacement
    man-pages                         # extra man pages
    ncdu                              # disk space
    ripgrep                           # grep replacement

    ## Tools / useful cli
    swappy                            # snapshot editing tool
    woomer

    ## Monitoring / fetch
    htop

    ## Multimedia
    imv
    mpv

    ## Utilities
    ffmpeg
    file                              # Show file information
    jq                                # JSON processor
    killall
    libnotify
    openssl
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    udiskie                           # Automounter for removable media
    unzip
    wget
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils

    ## For btop
    nvtopPackages.intel

    winetricks
    wineWowPackages.waylandFull
  ];

  programs = {
    btop = {
      enable = true;

      settings = {
        color_theme = "TTY";
        theme_background = false;
        update_ms = 500;
        rounded_corners = false;
      };
    };
    
    lazygit = {
      enable = true;

      settings = {
        gui.border = "single";
      };
    };

    neovim = {
      enable = true;
      vimAlias = true;
    };
  };
}
