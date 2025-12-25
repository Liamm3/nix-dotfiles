{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../home-manager-modules/cli.nix
    ../../home-manager-modules/desktop.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
  home.username = "liam";
  home.homeDirectory = "/home/liam";

  wayland.windowManager.hyprland.settings.natural_scroll = true;
}
