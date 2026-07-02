{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    # eza, fzf, zoxide, starship and fish come from ./shell.nix
    fd # find replacement
    ripgrep # grep replacement

    ## Tools / useful cli
    jq # JSON processor
    file # Show file information
    wget
    htop

    ## Archives
    zip
    unzip
    p7zip

    ## Multimedia
    ffmpeg
    mpd
    mpc

    ## Language servers
    tailwindcss-language-server
  ];

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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
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
