{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    # eza, fzf, zoxide, starship and fish come from ../shell.nix
    fd
    ripgrep

    ## Tools / useful cli
    yazi
    jq
    file
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

    ## Dev / language servers (matching the Stow setup that's being replaced)
    typescript-language-server
    tailwindcss-language-server
    sqlite
  ];

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
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
