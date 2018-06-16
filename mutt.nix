{ pkgs, ... }:
{
  home.packages = [
    pkgs.mutt
    pkgs.lynx
    pkgs.urlview
  ];
}
