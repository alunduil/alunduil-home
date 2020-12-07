{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal-install
    pkgs.cabal2nix
    pkgs.ghc
  ];

  xdg.configFile."stylish-haskell/config.yaml".source = ./stylish-haskell.yaml;
}
