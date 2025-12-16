{
  inputs,
  ...
}:
{
  imports = [ inputs.noctalia.homeModules.default ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here; defaults will
      # be deep merged with these attributes.
      bar = {
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            # {
            #   id = "SidePanelToggle";
            #   useDistroLogo = true;
            # }
            {
              id = "ActiveWindow";
              colorizeIcons = false;
              hideMode = "hidden";
              maxWidth = 145;
              scrollingMode = "hover";
              showIcon = true;
              useFixedWidth = false;
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "SystemMonitor";
              diskPath = "/";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = true;
              showDiskAsPercent = true;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = false;
              usePrimaryColor = false;
            }
            {
              id = "Tray";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "Volume";
            }
            {
              id = "KeyboardLayout";
              displayMode = "forceOpen";
            }
            {
              id = "Clock";
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Catppuccin";
      dock.enabled = false;
      general = {
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = false;
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        name = "Palo Alto, US";
      };
    };
    # this may also be a string or a path to a JSON file,
    # but in this case must include *all* settings.
  };
}
