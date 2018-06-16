{ ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ./vimrc;
  };
}
