{ lib, ... }:
{
  imports = [
    ./modules/common.nix
    ./modules/alacritty.nix
    ./modules/helix
    ./modules/emacs.nix
    ./modules/zellij.nix
    ./modules/zsh.nix
  ];


  home = {
    username = "anddani";
    homeDirectory = "/home/anddani";
    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    zsh = {
      initExtraBeforeCompInit = ''
        eval "$(starship init zsh)"
      '';
    };
    alacritty.settings.font.size = lib.mkForce 16;
  };
  home.file.".ideavimrc".text = ''
    set surround
    set incsearch
    set hlsearch

    let mapleader = ","

    map <Space> zz
    map <leader>rc :action ReformatCode<CR>
    map <leader>gf :action GotoFile<CR>
    map <leader>gc :action GotoClass<CR>
    map <leader>gs :action GotoSymbol<CR>
  '';
}
