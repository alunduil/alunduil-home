{ pkgs, ... }:
{
  imports = [
    ./erlang.nix
    ./haskell.nix
    ./python.nix
    ./rust.nix
  ];

  home.packages = [
    pkgs.travis
  ];
}
