{ pkgs, ... }:
{
  home.packages = [
    pkgs.python3
    pkgs.python36Packages.python-language-server
    pkgs.python36Packages.virtualenv
  ];
}
