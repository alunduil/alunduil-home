{ pkgs, ... }:
{
  home = {
    packages = [
      pkgs.cabal2nix
      pkgs.cabal-install
      pkgs.cfssl
      pkgs.dos2unix
      pkgs.file
      pkgs.irssi
      pkgs.lynx
      pkgs.mutt
      pkgs.myHaskellPackages
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
