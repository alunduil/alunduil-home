{ pkgs, ... }:
{
  imports = [
    ./gpg.nix
    ./haskell.nix
    ./vim
    ./xresources.nix
    ./zsh
  ];

  home = {
    file."bin" = {
      recursive = true;
      source = ./bin;
      target = ".bin";
    };

    packages = [
      pkgs.file
      pkgs.irssi
      pkgs.nixops
      pkgs.tig
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-18.03.tar.gz;
  };
}
