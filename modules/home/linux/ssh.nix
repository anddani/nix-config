{ ... }:
{
  programs.ssh.matchBlocks = {
    github.identityFile = "~/.ssh/id_github";

    aur = {
      host = "aur.archlinux.org";
      user = "aur";
      identityFile = "~/.ssh/id_github";
    };
  };

  services.ssh-agent.enable = true;
}
