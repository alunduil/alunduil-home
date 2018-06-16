{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal2nix
    pkgs.cabal-install
    pkgs.myHaskellPackages # from config.nix
  ];
}
