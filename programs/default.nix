{ ... }:
{
  imports = [
    ./alacritty
    ./gpg.nix
    ./htop.nix
    ./tmux
    ./vim
    ./zsh
  ];

  programs = {
    direnv.enable = true;
    jq.enable = true;
  };
}
