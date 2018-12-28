{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal2nix
    pkgs.cabal-install
    pkgs.haskellPackages.haskell-ci
    pkgs.haskellPackages.haskell-lsp
    pkgs.haskellPackages.haskell-lsp-types
    pkgs.myHaskellPackages # from config.nix
  ];
}
