{ ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      modules-left = [
        "hyprland/workspaces"
      ];
      "hyprland/workspaces" = {
        format = "{name}";
        format-icons = {
          urgent = "";
          active = "";
          visible = "";
          default = "";
          empty = "";
        };
        all-outputs = false;
      };
    };
  };
}