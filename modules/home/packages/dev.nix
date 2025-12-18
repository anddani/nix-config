{ pkgs, ... }:
{
  home.packages = with pkgs; [
    direnv

    claude-code
    tabiew
    opentofu
    tofu-ls

    terraform
    terraform-ls

    ## Lsp
    nixd # nix

    ## formating
    nixfmt-rfc-style

    ## Python
    python3
    python312Packages.ipython

    ## JS
    nodejs
    yarn
    bun
  ];
}
