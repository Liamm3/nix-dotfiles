{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.self.outputs.homeManagerModules.default
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-3, preferred, 0x500, 1"
      "DP-5, preferred, 1920x0, 1"
      "eDP-1, preferred, 5760x500, 1"
    ];
    # monitor = ",preferred,auto,1";
  };
}
