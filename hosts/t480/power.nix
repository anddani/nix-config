{ ... }:
{
  # Headless box — manage it over SSH
  services.openssh.enable = true;

  # Runs 24/7 with the lid closed
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
  };
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
  '';

  # Plugged in permanently: cap charge at 80% so the battery survives,
  # while still acting as a built-in UPS. T480 has two batteries:
  # BAT0 = removable, BAT1 = internal.
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 60;
      STOP_CHARGE_THRESH_BAT0 = 80;
      START_CHARGE_THRESH_BAT1 = 60;
      STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };
}
