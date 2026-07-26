{ lib, username, ... }:
{
  # Write access to the library dirs (they're setgid `media`, mode 2775)
  users.users.${username}.extraGroups = [ "media" ];

  # VPN-Confinement doesn't reliably mount the namespace's resolv.conf into
  # confined services when /etc/resolv.conf is a NetworkManager-managed
  # symlink, leaving them without DNS (providers fail with
  # "Temporary failure in name resolution"). Mount it explicitly.
  systemd.services =
    lib.genAttrs
      [
        "radarr"
        "sonarr"
        "prowlarr"
        "bazarr"
      ]
      (_: {
        serviceConfig.BindReadOnlyPaths = [ "/etc/netns/wg/resolv.conf:/etc/resolv.conf" ];
      });

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

    vpn = {
      enable = true;
      wgConf = "/var/lib/nixarr/wg.conf";
    };

    jellyfin = {
      enable = true;
      # Reachable from the TV app on http://t480:8096
      openFirewall = true;
    };

    radarr = {
      enable = true;
      openFirewall = true; # web UI on :7878
      vpn.enable = true;
    };
    sonarr = {
      enable = true;
      openFirewall = true; # web UI on :8989
      vpn.enable = true;
    };
    prowlarr = {
      enable = true;
      openFirewall = true; # web UI on :9696
      vpn.enable = true;
    };
    bazarr = {
      enable = true;
      openFirewall = true; # web UI on :6767
      vpn.enable = true;
    };

    transmission = {
      enable = true;
      openFirewall = true; # web UI on :9091
      vpn.enable = true;
      # Required when vpn.enable is set (the module rejects the null default).
      # Mullvad has no port forwarding, so inbound peers can't reach it anyway.
      peerPort = 51413;
    };
  };
}
