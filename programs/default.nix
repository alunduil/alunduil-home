{ ... }:
{
  imports = [
    ./alacritty.nix
    ./bashtop
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
