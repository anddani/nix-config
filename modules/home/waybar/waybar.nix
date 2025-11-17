{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];
  programs.waybar = {
    enable = true;
  };
  # catppuccin.waybar = {
  #   enable = true;
  #   flavor = "frappe";
  # };
}
