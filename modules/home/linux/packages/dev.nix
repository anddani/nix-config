{ pkgs, ... }:
{
  home.packages = with pkgs; [
    perl

    android-studio

    claude-code
    tabiew
    opentofu
    tofu-ls
    chromium
    lmstudio
    vhs
    magi

    dexter

    # Gleam
    rebar3
    gleam

    (elixir-with-otp erlang_28).latest
    erlang_28
    beam28Packages.expert
    elixir-ls
    inotify-tools

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

  programs = {

    # Not used as default terminal
    ghostty = {
      enable = true;
      settings = {
        theme = "Catppuccin Latte";
        cursor-style = "block";
        cursor-style-blink = false;
        shell-integration-features = "no-cursor";
        window-decoration = "none";
        window-theme = "system";
        font-family = "JetBrainsMono Nerd Font";
        font-size = 18;
      };
    };
  };
}
