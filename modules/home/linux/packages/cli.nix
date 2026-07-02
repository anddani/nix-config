{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    fd # find replacement
    man-pages # extra man pages
    ncdu # disk space
    ripgrep # grep replacement
    mpd
    mpc

    ## Tools / useful cli
    swappy # snapshot editing tool
    woomer

    ## Monitoring / fetch
    htop

    ## Multimedia
    imv
    mpv

    ## Utilities
    zip
    ffmpeg
    file # Show file information
    jq # JSON processor
    killall
    libnotify
    openssl
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    udiskie # Automounter for removable media
    unzip
    p7zip
    wget
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
    exiftool

    ## For btop
    nvtopPackages.intel

    winetricks
    wineWow64Packages.waylandFull
    wezterm
  ];

  xdg.configFile."wezterm/wezterm.lua".source = ../../../../dotfiles/.config/wezterm/wezterm.lua;

  catppuccin = {
    btop.enable = true;
    yazi.enable = true;
  };
  programs = {
    btop = {
      enable = true;

      settings = {
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
      withRuby = false;
      withPython3 = false;
    };

    yazi = {
      enable = true;

      enableFishIntegration = true;
      shellWrapperName = "y";

      settings = {
        manager = {
          layout = [
            1
            4
            3
          ];
          sort_by = "alphabetical";
          sort_sensitive = true;
          sort_reverse = false;
          sort_dir_first = true;
          linemode = "none";
          show_hidden = false;
          show_symlink = true;
        };

        preview = {
          tab_size = 2;
          max_width = 600;
          max_height = 900;
        };
      };
    };
  };
}
