{ pkgs, ... }:
{
  catppuccin = {
    fzf.enable = true;
    starship.enable = true;
    fish.enable = true;
  };

  programs = {
    eza.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'eza --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };

    starship = {
      enable = true;

      enableFishIntegration = true;
      settings = {
        character = {
          success_symbol = "[›](bold green)";
          error_symbol = "[›](bold red)";
        };

        git_status = {
          deleted = "✗";
          modified = "✶";
          staged = "✓";
          stashed = "≡";
        };

        nix_shell = {
          symbol = " ";
          heuristic = true;
        };
      };
    };

    fish = {
      enable = true;

      interactiveShellInit = ''
        set fish_greeting
        set PATH $PATH ~/.cargo/bin
        fish_vi_key_bindings
      '';

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd .././..";
        l = "eza -la";
        la = "eza -la";
        grep = "rg";
        c = "clear";
        lg = "lazygit";
        cd = "z";
        cr = "cargo run";
      };

      plugins = [
        {
          name = "plugin-git";
          src = pkgs.fishPlugins.plugin-git.src;
        }
        {
          name = "autopair";
          src = pkgs.fishPlugins.autopair.src;
        }
      ];
    };
  };
}
