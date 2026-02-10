{ ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      modules-left = [
        "ext/workspaces"
      ];
      modules-center = [
        "dwl/window"
      ];
      modules-right = [
        "pulseaudio"
        "network"
        "temperature"
        "battery"
        "clock"
      ];
      "ext/workspaces" = {
        format = "{icon}";
        on-click = "activate";
        sort-by-id = true;
        ignore-hidden = false;
      };
      "dwl/tags" = {
        num-tags = 9;
      };
      "dwl/window" = {
        format = "{title}";
      };
      clock = {
        format = "{:%d.%m.%Y %H:%M}";
      };
      network = {
        format-wifi = "{essid}";
      };
    };

    style = ''
          * {
        border: none;
        border-radius: 0;
        font-family: monospace;
        font-size: 14px;
        min-height: 0;
      }

      window#waybar {
        background: #201b14;
        color: #bbbbbb;
      }

      #workspaces button {
        padding: 0 8px;
        background: transparent;
        color: #bbbbbb;
        border-bottom: 3px solid transparent;
      }

      #workspaces button.active {
        background: #c9b890;
        color: #201b14;
      }

      #workspaces button.urgent {
        background: #ad401f;
        color: #eeeeee;
      }

      #workspaces button:hover {
        background: #444444;
        color: #eeeeee;
      }

      #window {
        padding: 0 10px;
        color: #bbbbbb;
      }

      #pulseaudio,
      #battery,
      #network,
      #cpu,
      #temperature,
      #clock {
        padding: 0 10px;
        background-color: #282a36; /* Falls du farbige "Pillen" willst */
        border-radius: 8px;
        margin-left: 10px;
      }
    '';
  };
}
