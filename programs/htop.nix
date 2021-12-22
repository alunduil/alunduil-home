{ ... }:
{
  programs.htop = {
    enable = true;
    settings = {
      color_cheme = 6; # Broken Gray
      hide_threads = true;
    };
  };
}
