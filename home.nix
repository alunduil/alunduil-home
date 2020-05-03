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

      "battery" = {
        source = pkgs.fetchFromGitHub {
          owner = "richo";
          repo = "battery";
          rev = "0ea66073e9a05934de9b0658874efa96becabebd";
          sha256 = "04pc633anlw4faig6na2nl4p6jhqxw17g7m9jnz4sa8l2n768kzd";
        } + "/bin/battery";
        target = ".bin/battery";
        executable = true;
      };
    };

    packages = [
      pkgs.file
      pkgs.irssi
      pkgs.nixops
      pkgs.skaffold
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  systemd.user = {
    services."nix-env-update" = {
      Unit = {
        Description = "nix-env -u";
        Documentation = "man:nix-env(1)";
      };

      Service.ExecStart = "${pkgs.nix}/bin/nix-env -u";
    };

    timers."nix-env-update" = {
      Timer.OnCalendar = "daily";
      Install.WantedBy = [ "timers.target" ];
    };
  };
}
