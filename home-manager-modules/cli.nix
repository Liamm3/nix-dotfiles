{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    nixfmt
    wget
    nitch
    brightnessctl
    fastfetch
    grim
    slurp

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
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"
        "$python"
        "$character"
      ];
      directory = {
        style = "blue";
      };
      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "";
        untracked = "";
        modified = "";
        staged = "";
        renamed = "";
        deleted = "";
        stashed = "≡";
      };
      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
      python = {
        format = "[$virtualenv]($style) ";
        style = "bright-black";
      };
    };
  };
  programs.swappy.enable = true;
}
