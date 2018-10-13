{ pkgs, config, ... }:
{
  imports = [
    ./direnv.nix
    ./erlang.nix
    ./gpg.nix
    ./haskell.nix
    ./htop.nix
    ./python.nix
    ./rust.nix
    ./tmux
    ./vim
    ./xresources.nix
    ./zsh
  ];

  home = {
    file."bin" = {
      recursive = true;
      source = ./bin;
      target = ".bin";
    };

    packages = [
      pkgs.file
      pkgs.gcc
      pkgs.gnumake
      pkgs.irssi
      pkgs.nixops
      pkgs.rebar3
      pkgs.shellcheck
      pkgs.tig
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-18.09.tar.gz;
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

  xdg.configFile."user-tmpfiles.d" = {
    recursive = true;
    source = ./user-tmpfiles.d;
    target = "user-tmpfiles.d";
  };
}
