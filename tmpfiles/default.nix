{ pkgs, ... }:
{
  systemd.user = {
    services = {
      "systemd-tmpfiles-clean" = {
        Unit = {
          Description = "Cleanup of User's Temporary Files and Directories";
          Documentation = "man:tmpfiles.d(5) man:systemd-tmpfiles(8)";
          DefaultDependencies = "no";
          Conflicts = "shutdown.target";
          Before = "basic.target shutdown.target";
        };

        Service = {
          Type = "oneshot";
          ExecStart = "${pkgs.systemd}/bin/systemd-tmpfiles --user --clean";
          SuccessExitStatus = "65";
          IOSchedulingClass = "idle";
        };
      };

      "systemd-tmpfiles-setup" = {
        Unit = {
          Description = "Create User's Volatile Files and Directories";
          Documentation = "man:tmpfiles.d(5) man:systemd-tmpfiles(8)";
          DefaultDependencies = "no";
          Conflicts = "shutdown.target";
          Before = "basic.target shutdown.target";
          RefuseManualStop = "yes";
        };

        Service = {
          Type = "oneshot";
          RemainAfterExit = "yes";
          ExecStart = "${pkgs.systemd}/bin/systemd-tmpfiles --user --create --remove --boot";
          SuccessExitStatus = "65";
        };

        Install = {
          WantedBy = [ "basic.target" ];
        };
      };
    };

    timers = {
      "systemd-tmpfiles-clean" = {
        Unit = {
          Description = "Daily Cleanup of User's Temporary Directories";
          Documentation = "man:tmpfiles.d(5) man:systemd-tmpefiles(8)";
        };

        Timer = {
          OnStartupSec = "5min";
          OnUnitActiveSec = "1d";
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
