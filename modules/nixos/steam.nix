{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gamescope
    protonup-qt
  ];
  programs = {
    steam = {
      enable = true;
      protontricks = {
        enable = true;
      };
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;

      gamescopeSession.enable = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    # gamescope = {
    #   enable = true;
    #   capSysNice = true;
    #   args = [
    #     "--rt"
    #     "--expose-wayland"
    #   ];
    # };
  };
}
