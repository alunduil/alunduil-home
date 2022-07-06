{ pkgs, ... }:
{
  imports = [
    ./direnv.nix
    ./git.nix
    ./gpg.nix
    ./home-manager.nix
    ./htop.nix
    ./man.nix
    ./nix-env.nix
    ./tmux
    ./vim
    ./zsh
  ];

  home.packages = [
    pkgs.file
    pkgs.nixops
  ];

  programs = {
    dircolors.enable = true;
    jq.enable = true;
    less.enable = true;
    lesspipe.enable = true;
    nix-index.enable = true;
  };
}
