# How to add a theme: https://www.reddit.com/r/Nix/comments/18o6698/foot_configuration_in_homemanager_importing_a/
{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMonoNerdFont:size=9";
        dpi-aware = "yes";
      };
    };
  };
}