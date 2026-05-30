{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        serif = [ "Noto Serif" ];
        sansSerif = [ "Inter" ];
      };
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>
          <alias>
            <family>ui-monospace</family>
            <default><family>monospace</family></default>
          </alias>

          <alias binding="same">
            <family>Liberation Mono</family>
            <prefer><family>JetBrainsMono Nerd Font</family></prefer>
          </alias>

          <alias>
            <family>system-ui</family>
            <prefer><family>Inter</family></prefer>
          </alias>

          <alias>
            <family>-apple-system</family>
            <prefer><family>Inter</family></prefer>
          </alias>

          <alias>
            <family>BlinkMacSystemFont</family>
            <prefer><family>Inter</family></prefer>
          </alias>
        </fontconfig>
      '';
    };
    packages = with pkgs; [
      inter
      roboto
      corefonts
      noto-fonts
      noto-fonts-color-emoji
      font-awesome
      material-icons
      dejavu_fonts
      open-sans

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
