{ pkgs, ... }:
{
  home.packages = [
    pkgs.python3
    pkgs.python37Packages.pyls-black
    pkgs.python37Packages.pyls-isort
    pkgs.python37Packages.pyls-mypy
    pkgs.python37Packages.python-language-server
    pkgs.python37Packages.virtualenv
  ];
}
