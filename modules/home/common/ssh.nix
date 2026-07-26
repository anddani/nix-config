{ ... }:
{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    # Attribute names are Host patterns; values use OpenSSH directive names.
    settings = {
      "*" = {
        AddKeysToAgent = "1h";

        ControlMaster = "auto";
        ControlPath = "~/.ssh/control-%r@%h:%p";
        ControlPersist = "10m";

        ForwardAgent = false;
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
      };

      "t480" = {
        HostName = "t480.local";
        User = "anddani";
      };

      # IdentityFile is platform-specific, set in linux/ssh.nix and darwin/ssh.nix
      "github.com" = {
        HostName = "ssh.github.com";
        User = "git";
        Port = 443;
        IdentitiesOnly = true;
      };
    };
  };
}
