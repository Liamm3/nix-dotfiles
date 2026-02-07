{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.mango.hmModules.mango
    ./cli.nix
    ./desktop.nix
    ./mango.nix
  ];
  
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
  home.username = "liam";
  home.homeDirectory = "/home/liam";
}
