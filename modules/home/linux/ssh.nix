{ ... }:
{
  programs.ssh.settings = {
    "github.com".IdentityFile = "~/.ssh/id_github";

    "aur.archlinux.org" = {
      User = "aur";
      IdentityFile = "~/.ssh/id_github";
    };
  };

  services.ssh-agent.enable = true;
}
