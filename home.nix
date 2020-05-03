{ pkgs, config, ... }:
{
  imports = [
    ./cursor.nix
    ./languages
    ./programs
    ./tmpfiles
  ];

  home = {
    file = {
      "bin" = {
        recursive = true;
        source = ./bin;
        target = ".bin";
      };
    };

    sessionVariables = {
      EDITOR = "vim";
    };
  };
}
