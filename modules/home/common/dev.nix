{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Essentials
    magi
    nixd
    nixfmt
    vhs
    ncdu
    
    # Gleam
    rebar3
    gleam

    # Elixir
    (elixir-with-otp erlang_28).latest
    erlang_28
    beam28Packages.expert
    elixir-ls
    dexter

    opentofu
    tofu-ls
    terraform
    terraform-ls

    # Python
    python3
    python312Packages.ipython

    # JS
    nodejs
    yarn
    bun
    vscode-langservers-extracted

    # Other
    perl
    tabiew
    lmstudio
  ];
}
