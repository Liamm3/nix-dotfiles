{ ... }:
{
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
}