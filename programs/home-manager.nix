{ ... }:
{
  manual.manpages.enable = false;

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-21.11.tar.gz;
  };

  systemd.user = {
    services = {
      "home-manager-switch" = {
        Unit = {
          Description = "home-manager switch";
          Documentation = "https://rycee.gitlab.io/home-manager/options.html";
        };

        Service = {
          ExecStart = "%h/.nix-profile/bin/home-manager switch";
          Environment = "PATH=\${PATH}:/run/current-system/sw/bin";
        };
      };

      "home-manager-expire" = {
        Unit = {
          Description = "home-manager expire-generations";
          Documentation = "https://rycee.gitlab.io/home-manager/options.html";
          After = [ "home-manager-switch.service" ];
        };

        Service.ExecStart = "%h/.nix-profile/bin/home-manager expire-generations \"-7 days\"";
      };
    };

    timers = {
      "home-manager-switch" = {
        Timer.OnCalendar = "daily";
        Install.WantedBy = [ "timers.target" ];
      };

      "home-manager-expire" = {
        Timer.OnCalendar = "daily";
        Install.WantedBy = [ "timers.target" ];
      };
    };
  };
}
