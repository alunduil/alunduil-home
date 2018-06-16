{ pkgs, ... }:
{
  home = {
    let myHaskellPackages =
          haskellPackages:

          with haskellPackages;
          [
            cabal-install
            hindent
            hlint
          ];
    in packages = [
         pkgs.haskellPackages.ghcWithHoogle myHaskellPackages

         pkgs.cabal2nix
         pkgs.cfssl
         pkgs.dos2unix
         pkgs.file
         pkgs.irssi
         pkgs.lynx
         pkgs.mutt
         pkgs.mypy
         pkgs.nixops
         pkgs.screen
         pkgs.tig
         pkgs.travis
         pkgs.urlview
      ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-18.03.tar.gz;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };
}
