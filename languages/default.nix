{ pkgs, ... }:
{
  imports = [
    ./dhall.nix
    ./haskell
    ./python.nix
    ./ruby.nix
    ./rust.nix
    ./shell.nix
  ];

  home.packages = [
    pkgs.pijul
    pkgs.tig
    pkgs.travis
    pkgs.pre-commit
  ];
}
