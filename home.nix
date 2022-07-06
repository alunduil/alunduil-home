{ pkgs, config, ... }:
{
  imports = [
    ./languages
    ./programs
    ./tmpfiles
  ];

  home = {
    enableNixpkgsReleaseCheck = true;

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

    stateVersion = "19.03";
  };
}
