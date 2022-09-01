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
            "/usr/bin/env sudo mount -t zfs ${snapshotName} %t/%N"
          ];
          ExecStart = "${pkgs.rclone}/bin/rclone sync %t/%N/alunduil Drive:%l.alunduil.com --log-level INFO --log-systemd --fast-list --copy-links --delete-excluded --exclude /.cache/** --exclude /.nix-*/** --exclude /.wine/**";
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
