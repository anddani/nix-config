{ pkgs, ... }:
{
  home.packages = with pkgs; [
    perl
    direnv

    claude-code
    tabiew
    opentofu
    tofu-ls
    chromium
    gitu
    lmstudio

    (elixir-with-otp erlang_28).latest
    erlang_28
    elixir-ls
    inotify-tools

    tailwindcss-language-server
    vscode-langservers-extracted

    terraform
    terraform-ls

    ## Lsp
    nixd # nix

    ## formating
    nixfmt

    ## Python
    python3
    python312Packages.ipython

    ## JS
    nodejs
    yarn
    bun
  ];
}
