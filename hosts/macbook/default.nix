{ username, hostname, ... }:
{
  imports = [
    ./../../modules/darwin
  ];

  networking.hostName = hostname;
  networking.computerName = hostname;

  # The user nix-darwin / Homebrew act on behalf of. Required by recent
  # nix-darwin for any user-scoped option (Homebrew, defaults, etc.).
  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };
}
