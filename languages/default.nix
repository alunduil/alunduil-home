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
    pkgs.travis
  ];
}
