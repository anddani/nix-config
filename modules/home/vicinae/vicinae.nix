{ inputs, ... }:
{
  imports = [ inputs.vicinae.homeManagerModules.default ];

  # services.vicinae = {
  #   enable = true;
  #   systemd = {
      
  #   }
  # };
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
  };

  xdg.configFile."vicinae/vicinae.json".source = ./vicinae.json;
  xdg.configFile."vicinae/themes/gruvbox-dark-hard.json".source = ./gruvbox-dark-hard.json;
}
