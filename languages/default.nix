{ pkgs, ... }:
{
  imports = [
    ./dhall.nix
    ./erlang.nix
    ./haskell
    ./python.nix
    ./rust.nix
    ./shell.nix
  ];

  home.packages = [
    pkgs.cfssl
    pkgs.gcc
    pkgs.gnumake
    pkgs.pijul
    pkgs.skaffold
    pkgs.tig
    pkgs.travis
  ];
}
