{ config, pkgs, inputs, lib, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    libreoffice
    nitch
    nautilus
    brightnessctl
  ];

  # Desktop
  programs.wofi.enable = true;
  programs.librewolf = {
    enable = true;
    profiles = {
      private = {
        id = 0;
	settings = {
	  "privacy.clearOnShutdown.history" = false;
          "privacy.clearOnShutdown.cookies" = false;
	};
	search.default = "ddg";
      };
      work = {
        id = 1;
        settings = {
	  "privacy.clearOnShutdown.history" = false;
          "privacy.clearOnShutdown.cookies" = false;
	};
	search.default = "google";
      };
    };
  };
  programs.kitty.enable = true;
  programs.keepassxc.enable = true;
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      modules-left = [
        "hyprland/workspaces"
      ];
      "hyprland/workspaces" = {
        format = "{name}";
        format-icons = {
          urgent = "";
          active = "";
          visible = "";
          default = "";
          empty = "";
        };
        all-outputs = false;
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
    ];
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {
      plugin = {
        split-monitor-workspaces.count = 5;
      };
      monitor = lib.mkDefault ",preferred,auto,1";
      exec-once = [
	"hyprpm reload -n"
        "waybar"
      ];
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      "$mod" = "SUPER";
      "$browser" = "librewolf";
      "$term" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun";
      general = {
        allow_tearing = false;
	gaps_in = 8;
	gaps_out = 8;
	border_size = 1;
	layout = "master";
      };
      decoration = {
        rounding = 2;
	rounding_power = 2.0;
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
	special_scale_factor = 0.8;
        new_status = "slave";
      };
      input = {
        repeat_rate = 25;
	repeat_delay = 170;
	natural_scroll = lib.mkDefault false;
      };
      gesture = [
        "3, horizontal, workspace"
      ];
      bind = [
        "$mod SHIFT, Q, exit"

	# Applications
        "$mod, W, exec, $browser"
        "$mod, Return, exec, $term"
        "$mod, E, exec, $fileManager"
        "$mod, P, exec, $menu"
        "$mod SHIFT, K, exec, keepassxc"

	# Workspace movement
	"$mod, B, split-cycleworkspaces, prev"
	"$mod, N, split-cycleworkspaces, next"

	# Monitor movement
	"$mod, Comma, focusmonitor, -1"
	"$mod, Period, focusmonitor, +1"
	"$mod SHIFT, Comma, split-changemonitorsilent, prev"
	"$mod SHIFT, Period, split-changemonitorsilent, next"

	# Window management
        "$mod, C, killactive"

	# Master layout
	"$mod SHIFT, Return, layoutmsg, swapwithmaster"
	"$mod, J, layoutmsg, cyclenext"
	"$mod, K, layoutmsg, cycleprev"
	"$mod SHIFT, J, layoutmsg, swapnext"
	"$mod SHIFT, K, layoutmsg, swapprev"
	"$mod, H, layoutmsg, mfact -0.1"
	"$mod, L, layoutmsg, mfact +0.1"
	"$mod, M, fullscreen, 1"

        # Special workspace
	"$mod, S, togglespecialworkspace, magic"
	"$mod SHIFT, S, split-movetoworkspace, special:magic"
      ]
      ++ (
        builtins.concatLists (builtins.genList(i :
	  let ws = i + 1;
	  in [
	    "$mod, code:1${toString i}, split-workspace, ${toString ws}"
	    "$mod SHIFT, code:1${toString i}, split-movetoworkspacesilent, ${toString ws}"
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
  services.hyprpaper = {
    enable = lib.mkDefault true;
    settings = {
      splash = false;
      # path = "/home/liam/nix-dotfiles/wallpapers/sky-1.jpg";
      preload = [
        "/home/liam/nix-dotfiles/wallpapers/sky-1.jpg"
      ];
      wallpaper = [
        "eDP-1,/home/liam/nix-dotfiles/wallpapers/sky-1.jpg"
        "DP-3,/home/liam/nix-dotfiles/wallpapers/sky-1.jpg"
        "DP-5,/home/liam/nix-dotfiles/wallpapers/sky-1.jpg"
      ];
    };
  };

  services.hyprpolkitagent.enable = true;
  services.syncthing.enable = true;
  services.mako.enable = true;
  services.playerctld.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
