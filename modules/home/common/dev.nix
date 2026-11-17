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
    (elixir-with-otp beam28Packages.erlang).latest
    beam28Packages.erlang
    beam28Packages.expert
    elixir-ls
    dexter

    opentofu
    tofu-ls
    terraform
    terraform-ls

    # Java
    jdk21
    gradle

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
