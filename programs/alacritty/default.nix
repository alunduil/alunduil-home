{ ... }:
{
  xdg.configFile."alacrity" = {
    source = ./alacritty.yml;
    target = "alacritty/alacritty.yml";
  };
}
