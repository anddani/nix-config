{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # intel-media-driver
        # (vaapiIntel.override { enableHybridCodec = true; })
        # vaapiVdpau
        # libvdpau-va-gl
      ];
    };
  };
  # hardware.enableRedistributableFirmware = true;
}
