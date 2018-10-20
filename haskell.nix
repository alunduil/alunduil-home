{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal2nix
    pkgs.cabal-install
    pkgs.multi-ghc-travis
    pkgs.myHaskellPackages # from config.nix
  ];
}
