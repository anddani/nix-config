{ pkgs, host, ... }:
{
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
