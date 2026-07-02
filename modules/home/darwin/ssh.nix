{ ... }:
{
  # No systemd ssh-agent on macOS; the base ssh config lives in ../common/ssh.nix
  programs.ssh.matchBlocks.github.identityFile = "~/.ssh/id_ed25519";
}
