{ pkgs, username, ... }:
{

  systemd.services.mpd = {
    environment = {
      # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
      XDG_RUNTIME_DIR = "/run/user/${username}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
    };
    serviceConfig.SupplementaryGroups = [ "pipewire" ];
  };
  services.mpd = {
    enable = true;
    user = username;
    settings.music_directory = "/home/anddani/Music";
    settings.audio_output = [
      {
        type = "pipewire";
        name = "My PipeWire Output";
      }
    ];
  };
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    systemWide = true;
    # lowLatency.enable = true;
  };
  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
