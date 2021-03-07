{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnupg
  ];

  programs.gpg = {
    enable = true;
    settings = {
      emit-version = false;
      no-comment = true;
      with-fingerprint = true;
    };
  };

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
        SuccessExitStatus = [ 2 ];
      };
    };

    timers."gpg-refresh-keys" = {
      Unit = {
        Description = "GnuPG Refresh Keys";
        Documentation = "man:gpg(1)";
      };

      Timer.OnCalendar = "daily";
      Install.WantedBy = [ "timers.target" ];
    };
  };
}
