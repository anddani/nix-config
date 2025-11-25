{ pkgs, ... }:
{
  home.packages = with pkgs; [
    starship
    zsh-powerlevel10k
  ];

  programs = {
    zsh = {
      enable = true;
      initContent = builtins.readFile ../../dotfiles/.zshrc;
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home.file.".p10k.zsh".source = ../../dotfiles/.p10k.zsh;
  xdg.configFile."starship/starship.toml".source = ../../dotfiles/starship/starship.toml;
}
