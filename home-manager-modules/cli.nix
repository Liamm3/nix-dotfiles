{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    nixfmt
    wget
    nitch
    brightnessctl

    (writeShellScriptBin "nrs" ''
      sudo nixos-rebuild switch --flake /home/liam/nix-dotfiles
    '')

    (writeShellScriptBin "nrt" ''
      sudo nixos-rebuild test --flake /home/liam/nix-dotfiles
    '')
    
   (writeShellScriptBin "nu" ''
      sudo nix flake update --flake /home/liam/nix-dotfiles
    '')
  ];

  programs.htop.enable = true;
  programs.git = {
    enable = true;
    settings.user = {
      name = "Liamm3";
      email = "liam.wohlfart0@gmail.com";
    };
    settings.init.defaultBranch = "main";
  };
  programs.gh.enable = true;
  programs.zsh.enable = true;
  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.btop.enable = true;
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
    settings.updates.auto_update = true;
  };
}
