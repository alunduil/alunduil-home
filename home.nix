{ pkgs, config, ... }:
{
  imports = [
    ./cursor.nix
    ./languages
    ./programs
    ./tmpfiles
    ./xresources.nix
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
      pkgs.gcc
      pkgs.gnumake
      pkgs.irssi
      pkgs.nixops
      pkgs.pijul
      pkgs.shellcheck
      pkgs.tig
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-19.03.tar.gz;
  };

  systemd.user = {
    services = {
      /* TODO
      "home-manager-switch" = {
        Unit = {
          Description = "home-manager switch";
          Documentation = "https://rycee.gitlab.io/home-manager/options.html";
        };

        Service = {
          ExecStart = "home-manager switch";
          Environment = "PATH=${pkgs.nix}/bin";
        };
      };
      */

      "nix-env-update" = {
        Unit = {
          Description = "nix-env -u";
          Documentation = "man:nix-env(1)";
        };

        Service = {
          ExecStart = "${pkgs.nix}/bin/nix-env -u";
        };
      };
    };

    timers = {
      /* TODO
      "home-manager-switch" = {
        Timer = {
          OnCalendar = "daily";
        };

        Install = {
          WantedBy = [ "timers.target" ];
        };
      };
      */

      "nix-env-update" = {
        Timer = {
          OnCalendar = "daily";
        };

        Install = {
          WantedBy = [ "timers.target" ];
        };
      };
    };
  };
}
