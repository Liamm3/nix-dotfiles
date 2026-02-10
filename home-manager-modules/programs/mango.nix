{ ... }:
{
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      exec-once=waybar
      exec-once=swaync
      #exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots

      # In deiner Mango Conf
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
      exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

      # fcitx5 im
      env=GTK_IM_MODULE,fcitx
      env=QT_IM_MODULE,fcitx
      env=SDL_IM_MODULE,fcitx
      env=XMODIFIERS,@im=fcitx
      env=GLFW_IM_MODULE,ibus

      # scale factor about qt (herr is 1.4)
      env=QT_QPA_PLATFORMTHEME,qt5ct
      env=QT_AUTO_SCREEN_SCALE_FACTOR,1
      env=QT_QPA_PLATFORM,Wayland;xcb
      env=QT_WAYLAND_FORCE_DPI,140
      env=MOZ_ENABLE_WAYLAND,1

      # Acer 
      monitorrule=name:DP-3,width:1920,height:1080,refresh:60,x:0,y:250
      # LG Optifine
      monitorrule=name:DP-5,width:3840,height:2160,refresh:60,x:1920,y:10
      # ThinkPad Monitor
      monitorrule=name:eDP-1,width:1920,height:1200,refresh:60,x:5760,y:250

      repeat_rate=25
      repeat_delay=170
      xkb_rules_layout=us,de
      xkb_rules_options=grp:alt_shift_toggle

      bind=SUPER+SHIFT,q,quit
      bind=SUPER+SHIFT,r,reload_config
      bind=SUPER,n,viewtoright
      bind=SUPER,b,viewtoleft

      bind=SUPER,Return,spawn,foot
      bind=SUPER,p,spawn,rofi -show drun
      bind=SUPER,w,spawn,librewolf
      bind=SUPER+SHIFT,k,spawn,keepasxc
      bind=SUPER+SHIFT,t,spawn,Telegram
      bind=SUPER+SHIFT,w,spawn_shell,killall -SIGUSR2 waybar

      bind=SUPER,s,spawn_shell,slurp | grim -g - - | wl-copy
      bind=SUPER+SHIFT,s,spawn_shell,grim -g "$(slurp)" - | swappy -f -

      bind=SUPER,1,view,1
      bind=SUPER,2,view,2
      bind=SUPER,3,view,3
      bind=SUPER,4,view,4
      bind=SUPER,5,view,5
      bind=SUPER,6,view,6
      bind=SUPER,7,view,7
      bind=SUPER,8,view,8
      bind=SUPER,9,view,9

      bind=NONE,XF86AudioRaiseVolume,spawn, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bind=NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bind=NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind=NONE,XF86AudioMicMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl -e4 -n2 set 5%+
      bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl -e4 -n2 set 5%-

      bind=SUPER+SHIFT,1,tagsilent,1
      bind=SUPER+SHIFT,2,tagsilent,2
      bind=SUPER+SHIFT,3,tagsilent,3
      bind=SUPER+SHIFT,4,tagsilent,4
      bind=SUPER+SHIFT,5,tagsilent,5
      bind=SUPER+SHIFT,6,tagsilent,6
      bind=SUPER+SHIFT,7,tagsilent,7
      bind=SUPER+SHIFT,8,tagsilent,8
      bind=SUPER+SHIFT,9,tagsilent,9

      # switch window focus
      bind=SUPER,j,focusstack,next
      bind=SUPER,k,focusstack,prev

      # DWM style binds
      bind=SUPER,i,incnmaster,+1
      bind=SUPER,d,incnmaster,-1
      bind=SUPER,h,setmfact,-0.05
      bind=SUPER,l,setmfact,+0.05
      bind=SUPER+SHIFT,Return,zoom
      bind=SUPER,code:59,focusmon,left
      bind=SUPER,code:60,focusmon,right
      bind=SUPER+shift,code:59,tagmon,left,0
      bind=SUPER+shift,code:60,tagmon,right,0
      bind=SUPER,c,killclient

      # Unfortunately stack based exchange is still being worked on.
      bind=SUPER+SHIFT,j,exchange_stack_client,next
      bind=SUPER+SHIFT,k,exchange_stack_client,prev

      # Layouts
      bind=SUPER,t,setlayout,tile
      bind=SUPER,m,setlayout,monocle
      bind=SUPER,v,setlayout,vertical_grid
      bind=SUPER+SHIFT,v,setlayout,vertical_scroller

      # bind=SUPER,space,toggleoverview
      bind=SUPER,space,toggle_scratchpad

      # Layouts in mango are per tag. So we'll set all tags to tile by default. 
      tagrule=id:1,layout_name:tile
      tagrule=id:2,layout_name:tile
      tagrule=id:3,layout_name:tile
      tagrule=id:4,layout_name:tile
      tagrule=id:5,layout_name:tile
      tagrule=id:6,layout_name:tile
      tagrule=id:7,layout_name:tile
      tagrule=id:8,layout_name:tile
      tagrule=id:9,layout_name:tile

      # more layouts:
      # vertical:vertical_tile,vertical_scroller,vertical_grid,vertical_monocle,vertical_spiral,vertical_dwindle
      # Plus more being added

      # Animations are not suckless
      animations=0
      # space is not suckless
      gappih=0
      gappiv=0
      gappoh=0
      gappov=0
      borderpx=1
      no_border_when_single=0
      # fun colors are not suckless
      focuscolor=0xc9b890ff
      rootcolor=0x000000ff
      # globalcolor=0x000000ff
      # overlaycolor=0x000000ff

      # Mouse Button Bindings
      # NONE mode key only work in ov mode
      mousebind=SUPER,btn_left,moveresize,curmove
      mousebind=SUPER,btn_right,moveresize,curresize
      mousebind=NONE,btn_left,toggleoverview,-1
      mousebind=NONE,btn_right,killclient,0

      # Turn off silly defaults
      new_is_master=0
      enable_hotarea=0
      warpcursor=1
      sloppyfocus=1
      axis_bind_apply_timeout=100
      drag_tile_to_tile=1
      enable_floating_snap=0
      snap_distance=30
    '';
    autostart_sh = ''

    '';
  };
}
