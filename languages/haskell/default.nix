{ pkgs, ... }:
{
  home.packages = [
    pkgs.cabal2nix
    pkgs.cabal-install
  ];

  xdg.configFile."stylish-haskell/config.yaml".source = ./stylish-haskell.yaml;
}
