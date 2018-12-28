{ ... }:
{
  home.file."tmux.conf" = {
    source = ./tmux.conf;
    target = ".tmux.conf";
  };
}
