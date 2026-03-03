{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  environment.sessionVariables = {
    FLAKE = "/home/anddani/git/nix-home";
  };

  powerManagement.cpuFreqGovernor = "performance";
}
