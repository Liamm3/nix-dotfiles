{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    ./programs
  ];
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    telegram-desktop
    libreoffice
    nautilus
    jetbrains.phpstorm
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
