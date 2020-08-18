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
    pkgs.gitAndTools.pre-commit
    pkgs.gnumake
    pkgs.pijul
    pkgs.skaffold
    pkgs.tig
    pkgs.travis
  ];
}
