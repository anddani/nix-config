{
  inputs,
  ...
}:
{
  imports = [ inputs.noctalia.homeModules.default ];

  # configure options
  programs.noctalia = {
    enable = true;
    settings = {
      bar = {
        order = [ "main" ];
        main = {
          enabled = true;
          position = "top";
          capsule = false;
          margin_ends = 0;
          radius = 0;
          font_family = "JetBrainsMono Nerd Font";

          start = [
            "control-center"
            "active_window"
          ];

          center = [ "workspaces" ];

          end = [
            "cpu_usage"
            "cpu_temp"
            "disk_pct"
            "ram_usage"
            "ram_pct"
            "tray"
            "bluetooth"
            "volume"
            "keyboard_layout"
            "clock"
          ];

        };
      };

      widget = {
        active_window = {
          max_length = 145;
          title_scroll = "on_hover";
        };

        workspaces = {
          style = "regular";
          display = "none";
          hide_when_empty = false;
        };

        cpu_usage = {
          type = "sysmon";
          stat = "cpu_usage";
        };

        cpu_temp = {
          type = "sysmon";
          stat = "cpu_temp";
        };

        disk_pct = {
          type = "sysmon";
          stat = "disk_pct";
          path = "/";
        };

        ram_used = {
          type = "sysmon";
          stat = "ram_used";
        };

        ram_pct = {
          type = "sysmon";
          stat = "ram_pct";
        };

        clock = {
          format = "{:%H:%M %a, %b %d}";
        };
      };

      theme = {
        source = "builtin";
        builtin = "Kanagawa";
      };

      location = {
        auto_locate = false;
        address = "Palo Alto, US";
      };
      weather = {
        enabled = true;
        unit = "metric";
        effects = true;
      };
    };
  };
}
