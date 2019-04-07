{ ... }:
{
  programs.direnv = {
    enable = true;
    stdlib = ''
      # Usage: use nix
      #
      # Works like use_nix, except that it's only rebuilt if the shell.nix or
      # default.nix file changes.  This avoids scenarios where the nix-channel
      # is being updated and all the projects now need to be re-built.
      #
      # To force the reload the derivation, run `touch shell.nix`
      #
      # Lifted from https://github.com/direnv/direnv/wiki/Nix
      use_nix() {
        local shellfile="shell.nix"
        local wd="$PWD/.direnv/nix"
        local drvfile="$wd/shell.drv"
        local outfile="$wd/result"

        # same heuristic as nix-shell
        if [[ ! -f "$shellfile" ]]; then
          shellfile="default.nix"
        fi

        if [[ ! -f "$shellfile" ]]; then
          fail "use nix: shell.nix or default.nix not found in the folder"
        fi

        if [[ -f "$drvfile" && $(stat -c %Y "$shellfile") -gt $(stat -c %Y "$drvfile") ]]; then
          log_status "use nix: removing stale drv"
          rm "$drvfile"
        fi

        if [[ ! -f $drvfile ]]; then
          mkdir -p "$wd"
          # instantiate the drv like it was in a nix-shell
          IN_NIX_SHELL=1 nix-instantiate \
            --show-trace \
            --add-root "$drvfile" --indirect \
            "$shellfile" >/dev/null
        fi

        direnv_load nix-shell "$drvfile" --run "$(join_args "$direnv" dump)"
        watch_file "$shellfile"
      }
    '';
  };
}
