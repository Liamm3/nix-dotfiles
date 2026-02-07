{
  config,
  pkgs,
  inputs,
  ...
}:
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
    backupFileExtension = "backup";
  };
  networking.hostName = "nix-book";
  
  system.stateVersion = "25.11"; # Did you read the comment?
}
