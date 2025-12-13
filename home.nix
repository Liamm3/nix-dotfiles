{ config, pkgs, inputs, ... }:

{
  home.username = "liam";
  home.homeDirectory = "/home/liam";

  home.stateVersion = "25.11";

  services.playerctld.enable = true;

  programs.git = {
    enable = true;
    settings.user = {
      name = "Liamm3";
      email = "liam.wohlfart0@gmail.com";
    };
    settings.init.defaultBranch = "main";
  };
  
  # CLI Programs
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
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
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

  # Desktop
  programs.waybar.enable = true;
  programs.librewolf.enable = true;
  programs.kitty.enable = true;
  programs.keepassxc.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {
      monitor =",preferred,auto,1";
      exec-once = [
        "waybar"
      ];
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      "$mod" = "SUPER";
      "$browser" = "librewolf";
      "$term" = "kitty";
      "$fileManager" = "kitty -c yazi";
      "$menu" = "wofi --show drun";
      general = {
        allow_tearing = false;
	gaps_in = 10;
	gaps_out = 20;
	border_size = 3;
	layout = "master";
      };
      decoration = {
        rounding = 10;
	rounding_power = 2;
	shadow = {
	  enabled = true;
	  range = 4;
	  render_power = 3;
	};
	blur = {
	  enabled = true;
	  size = 3;
	  passes = 1;
	};
      };
      dwindle = {
        pseudotile = true;
	preserve_split = true;
      };
      master = {
        new_status = "slave";
      };
      input = {
        repeat_rate = 25;
	repeat_delay = 170;
	natural_scroll = true;
      };
      gesture = [
        "3, horizontal, workspace"
      ];
      bind = [
        "$mod SHIFT, Q, exit"
        "$mod, C, killactive"

	# Applications
        "$mod, W, exec, $browser"
        "$mod, Return, exec, $term"
        "$mod, E, exec, $fileManager"
        "$mod, P, exec, $menu"

	# Workspace movement
	"$mod, B, workspace, -1"
	"$mod, N, workspace, +1"

	# Master layout
	"$mod SHIFT, Return, layoutmsg, swapwithmaster"
	"$mod, J, layoutmsg, cyclenext"
	"$mod, K, layoutmsg, cycleprev"
	"$mod SHIFT, J, layoutmsg, swapnext"
	"$mod SHIFT, K, layoutmsg, swapprev"

        # Special workspace
	"$mod, S, togglespecialworkspace, magic"
	"$mod SHIFT, S, movetoworkspace, special:magic"
      ]
      ++ (
        builtins.concatLists (builtins.genList(i :
	  let ws = i + 1;
	  in [
	    "$mod, code:1${toString i}, workspace, ${toString ws}"
	    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	  ]
	)
        9)
      );
      bindel = [
	",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" 
	",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
	",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      windowrule = [
	# "suppressevent maximize, class:.*"
      ];
    };
  };

  home.packages = with pkgs; [
    wget
    wofi
    dunst
    telegram-desktop
    libreoffice
    fastfetch

    (writeShellScriptBin "nrs" ''
      sudo nixos-rebuild switch --flake /home/liam/nix-dotfiles#genesis
    '')

    (writeShellScriptBin "nrt" ''
      sudo nixos-rebuild test --flake /home/liam/nix-dotfiles#genesis
    '')
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
