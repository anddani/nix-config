{ pkgs, ... }:
{
  home.packages = with pkgs; [ starship ];

  programs = {
    zsh = {
      enable = true;
      initContent = builtins.readFile ../../dotfiles/.zshrc;

      zplug = {
        enable = true;
        plugins = [
        	{ name = "zsh-users/zsh-syntax-highlighting"; }
        	{ name = "zsh-users/zsh-completions"; }
        	{ name = "zsh-users/zsh-autosuggestions"; }
        	{ name = "wfxr/forgit"; }
        	{ name = "Aloxaf/fzf-tab"; }
        	{ name = "jeffreytse/zsh-vi-mode"; }
        ];
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  xdg.configFile."starship/starship.toml".source = ../../dotfiles/starship/starship.toml;
}
