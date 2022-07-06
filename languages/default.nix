{ pkgs, ... }:
{
  imports = [
    ./dhall.nix
    ./haskell
    ./python.nix
    ./shell.nix
  ];

  home.packages = [
    pkgs.pijul
    pkgs.tig
    pkgs.travis
    pkgs.pre-commit
  ];
}
