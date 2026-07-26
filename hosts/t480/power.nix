{ username, ... }:
{
  # Headless box — manage it over SSH
  services.openssh.enable = true;

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHjf2BK92352c/LiDzrGRupBPcUw/hpP4t4Q9fXK51w andredanielsson93@gmail.com"
  ];

  # Runs 24/7 with the lid closed
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
  };
  systemd.sleep.settings.Sleep = {
    AllowSuspend = false;
    AllowHibernation = false;
  };

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
