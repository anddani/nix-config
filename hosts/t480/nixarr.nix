{ ... }:
{
  # External HDD with the DVD backups. On the T480, find the drive with
  # `lsblk -f` and put its UUID here. If the drive is NTFS/exFAT, reformat
  # to ext4 first — nixarr's user/permission model needs a POSIX filesystem.
  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/REPLACE-WITH-HDD-UUID";
    fsType = "ext4";
    options = [
      # don't hang boot if the drive is unplugged
      "nofail"
      "x-systemd.device-timeout=10s"
    ];
  };

  nixarr = {
    enable = true;

    # Library lives on the external HDD; nixarr creates movies/, shows/,
    # etc. under here with correct ownership.
    mediaDir = "/data/media";

    # Keep app databases on the internal SSD — faster than the USB HDD and
    # the services survive the drive being unplugged.
    stateDir = "/var/lib/nixarr";

    jellyfin = {
      enable = true;
      # Reachable from the TV app on http://t480:8096
      openFirewall = true;
    };

    radarr = {
      enable = true;
      openFirewall = true; # web UI on :7878
    };
    sonarr = {
      enable = true;
      openFirewall = true; # web UI on :8989
    };
    prowlarr = {
      enable = true;
      openFirewall = true; # web UI on :9696
    };
    bazarr = {
      enable = true;
      openFirewall = true; # web UI on :6767
    };

    transmission = {
      enable = true;
      openFirewall = true; # web UI on :9091
    };
  };
}
