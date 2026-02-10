{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.self.outputs.homeManagerModules.default
  ];

  wayland.windowManager.hyprland.settings.natural_scroll = true;
}
