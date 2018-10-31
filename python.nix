{ pkgs, ... }:
{
  home.packages = [
    pkgs.python3
    pkgs.python36Packages.pyls-black
    pkgs.python36Packages.pyls-isort
    pkgs.python36Packages.pyls-mypy
    pkgs.python36Packages.python-language-server
    pkgs.python36Packages.virtualenv
  ];
}
