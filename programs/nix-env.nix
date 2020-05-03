{ pkgs, ... }:
{
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
