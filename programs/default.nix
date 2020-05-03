{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./bashtop
    ./battery.nix
    ./direnv.nix
    ./gpg.nix
    ./home-manager.nix
    ./htop.nix
    ./nix-env.nix
    ./tmux
    ./vim
    ./xmonad
    ./zsh
  ];

  home.packages = [
    pkgs.file
    pkgs.irssi
    pkgs.nixops
  ];

  programs.jq.enable = true;
}
