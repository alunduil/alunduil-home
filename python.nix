{ pkgs, ... }:
{
  home.packages = [
    pkgs.python3
    pkgs.python36Packages.virtualenv
  ];
}
