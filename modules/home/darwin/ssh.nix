{ ... }:
{
  # No systemd ssh-agent on macOS; the base ssh config lives in ../common/ssh.nix
  programs.ssh.settings."github.com".IdentityFile = "~/.ssh/id_ed25519";
}
