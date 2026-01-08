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

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-3, preferred, 0x500, 1"
      "DP-5, preferred, 1920x0, 1"
      "eDP-1, preferred, 5760x500, 1"
    ];
    # monitor = ",preferred,auto,1";
  };
}
