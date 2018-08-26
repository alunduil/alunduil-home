{ pkgs, ... }:
{
  home.packages = [
    pkgs.python36Packages.virtualenv
  ];
}
