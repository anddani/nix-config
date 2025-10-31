{ pkgs, host, ... }:
{
  networking = {
    hostName = "bee";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
