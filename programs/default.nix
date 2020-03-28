{ ... }:
{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./gpg.nix
    ./htop.nix
    ./tmux
    ./vim
    ./xmonad
    ./zsh
  ];

  programs.jq.enable = true;
}
