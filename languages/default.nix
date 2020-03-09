{ pkgs, ... }:
{
  imports = [
    ./dhall.nix
    ./erlang.nix
    ./haskell.nix
    ./python.nix
    ./rust.nix
  ];

  home.packages = [
    pkgs.cfssl
    pkgs.gcc
    pkgs.gnumake
    pkgs.pijul
    pkgs.shellcheck
    pkgs.tig
    pkgs.travis
  ];
}
