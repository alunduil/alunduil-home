{ pkgs, ... }:
{
  imports = [
    ./dhall.nix
    ./haskell
    ./ruby.nix
    ./rust.nix
    ./shell.nix
  ];

  home.packages = [
    pkgs.pijul
    pkgs.tig
    pkgs.travis
  ];
}
