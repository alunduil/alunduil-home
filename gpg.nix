{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnupg
  ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  systemd.user = {
    services."gpg-refresh-keys" = {
      Unit = {
        Description = "GnuPG Refresh Keys";
        Documentation = "man:gpg(1)";
      };

      Service = {
        ExecStart = "${pkgs.gnupg}/bin/gpg2 --refresh-keys";
      };
    };

    timers."gpg-refresh-keys" = {
      Unit = {
        Description = "GnuPG Refresh Keys";
        Documentation = "man:gpg(1)";
      };

      Timer = {
        OnCalendar = "daily";
      };

      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
