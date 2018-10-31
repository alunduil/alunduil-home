{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal2nix
    pkgs.cabal-install
    pkgs.haskellPackages.haskell-lsp
    pkgs.haskellPackages.haskell-lsp-types
    pkgs.haskellPackages.multi-ghc-travis
    pkgs.myHaskellPackages # from config.nix
  ];
}
