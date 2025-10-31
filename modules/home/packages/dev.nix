{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix

    ## formating
    nixfmt-rfc-style

    ## Python
    python3
    python312Packages.ipython
  ];
}
