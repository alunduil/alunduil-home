{ ... }:
{
  imports = [
    ./alacritty
    ./direnv.nix
    ./gpg.nix
    ./htop.nix
    ./tmux
    ./vim
    ./zsh
  ];

  programs.jq.enable = true;
}
