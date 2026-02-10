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

  home.packages = with pkgs; [
    telegram-desktop
    libreoffice
        nautilus
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
