{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono" ];
        serif = [ "Noto Serif" ];
        sansSerif = [ "Inter" ];
      };
    };
    packages = with pkgs; [
      roboto
      corefonts
      noto-fonts
      noto-fonts-color-emoji
      font-awesome
      material-icons
      dejavu_fonts
      open-sans
      liberation_ttf

      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.caskaydia-cove
      nerd-fonts.symbols-only
      twemoji-color-font
      fantasque-sans-mono
      ubuntu-sans
    ];
  };
}
