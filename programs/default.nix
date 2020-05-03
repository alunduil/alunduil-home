{ ... }:
{
  imports = [
    ./alacritty.nix
    ./bashtop
    ./direnv.nix
    ./gpg.nix
    ./home-manager.nix
    ./htop.nix
    ./tmux
    ./vim
    ./xmonad
    ./zsh
  ];

  programs.jq.enable = true;
}
