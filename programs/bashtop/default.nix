{ pkgs, ... }:
{
  home.file."bashtop" = {
    source = pkgs.fetchFromGitHub {
      owner = "aristocratos";
      repo = "bashtop";
      rev = "v0.8.22";
      sha256 = "1qaq3203lsl740kdgdkp8b9g03l682q5759h78hjwbrzj8iz24vc";
    } + "/bashtop";
    target = ".bin/bashtop";
    executable = true;
  };

  xdg.configFile."bashtop.cfg" = {
    recursive = true;
    source = ./bashtop;
    target = "bashtop";
  };
}
