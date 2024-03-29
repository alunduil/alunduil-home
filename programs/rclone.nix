{ pkgs, ... }:
{
  home.packages = [
    pkgs.rclone
  ];

  systemd.user = {
    services."rclone-sync-drive" = {
      Unit = {
        Description = "rclone $HOME Drive:odin.alunduil.com";
        Documentation = "man:rclone(1)";
      };

      Service = let snapshotName = "%l-boot/ROOT/home@%N"; in
        {
          ExecStartPre = [
            "-/usr/bin/env sudo zfs destroy -r ${snapshotName}"
            "/usr/bin/env sudo zfs snapshot -r ${snapshotName}"
            "/usr/bin/env mkdir -p %t/%N"
            "/usr/bin/env sudo mount -r -t zfs ${snapshotName} %t/%N"
          ];
          ExecStart = "${pkgs.rclone}/bin/rclone sync %t/%N/alunduil Drive:%l.alunduil.com --stats-log-level NOTICE --stats-one-line --log-systemd --fast-list --links";
          ExecStopPost = [
            "-/usr/bin/env sudo umount %t/%N"
            "/usr/bin/env sudo zfs destroy -r ${snapshotName}"
          ];
        };
    };

    timers."rclone-sync-drive" = {
      Unit = {
        Description = "rclone $HOME Drive:odin.alunduil.com";
        Documentation = "man:rclone(1)";
      };

      Timer.OnCalendar = "hourly";
      Install.WantedBy = [ "timers.target" ];
    };
  };
}
