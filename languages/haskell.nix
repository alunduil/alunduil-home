{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal2nix
    pkgs.cabal-install
    #pkgs.haskellPackages.brittany
    pkgs.haskellPackages.haskell-ci
    pkgs.haskellPackages.haskell-lsp
    pkgs.haskellPackages.haskell-lsp-types
    pkgs.haskellPackages.hpack
    #pkgs.haskellPackages.hpack-convert
    pkgs.haskellPackages.hpack-dhall
    pkgs.myHaskellPackages # from config.nix
  ];
}
