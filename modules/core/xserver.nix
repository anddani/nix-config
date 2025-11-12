{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,sv";
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # displayManager.autoLogin = {
    #   enable = true;
    #   user = "${username}";
    # };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
