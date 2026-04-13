{ pkgs, dexter, ... }:
{
  home.packages = with pkgs; [
    perl
    direnv

    android-studio

    claude-code
    tabiew
    opentofu
    tofu-ls
    chromium
    lmstudio
    vhs
    magi
    zellij

    dexter

    (elixir-with-otp erlang_28).latest
    erlang_28
    beam28Packages.expert
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

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Latte";
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";
      window-decoration = "none";
      window-theme = "system";
      font-family = "FiraCode Nerd Font";
      font-size = 18;
    };
  };
}
