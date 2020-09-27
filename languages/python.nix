{ pkgs, ... }:
{
  home.packages = [
    pkgs.pipenv
    pkgs.poetry
    #pkgs.prospector
    pkgs.python3
    pkgs.python37Packages.autopep8
    pkgs.python37Packages.bandit
    pkgs.python37Packages.black
    pkgs.python37Packages.flake8
    pkgs.python37Packages.mypy
    pkgs.python37Packages.pep8
    pkgs.python37Packages.pydocstyle
    pkgs.python37Packages.pylama
    pkgs.python37Packages.pylint
    pkgs.python37Packages.virtualenv
    pkgs.python37Packages.yapf
  ];

  programs.vim.plugins = [pkgs.vimPlugins.coc-python];
}
