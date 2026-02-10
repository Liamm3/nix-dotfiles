{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "liam" = import ./home.nix;
    };
  };

  networking.hostName = "genesis";
  system.stateVersion = "25.11";
}
