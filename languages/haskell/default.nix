{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal2nix
    pkgs.cabal-install
    #pkgs.haskell-ci
    pkgs.haskellPackages.haskell-lsp
    pkgs.haskellPackages.haskell-lsp-types
    pkgs.haskellPackages.hpack
    #pkgs.haskellPackages.hpack-convert
    #pkgs.haskellPackages.hpack-dhall
    pkgs.haskellPackages.stylish-haskell
  ];

  xdg.configFile."stylish-haskell/config.yaml".source = ./stylish-haskell.yaml;
}
