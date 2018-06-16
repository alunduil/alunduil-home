{ pkgs, ... }:
{
  imports = [
    ./gpg.nix
    ./haskell.nix
    ./home-manager.nix
    ./mutt.nix
    ./vim
    ./xresources.nix
    ./zsh
  ];

  home = {
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
}
