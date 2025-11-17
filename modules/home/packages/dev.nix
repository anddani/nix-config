{ pkgs, ... }:
{
  home.packages = with pkgs; [
    direnv

    ## Lsp
    nixd # nix

    ## formating
    nixfmt-rfc-style

    ## Python
    python3
    python312Packages.ipython
  ];
}
