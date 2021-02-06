{ config, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [ ];
      startup = [
        {
          command = ''
            swayidle -w timeout 180 'swaylock -f -c 000000' timeout 300 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' before-sleep 'swaylock -f -c 000000'
          '';
        }
      ];
      input = { "*" = { tap = "enabled"; }; };
      terminal = "alacritty";
    };
  };
}
