{ pkgs, ... }:
{
  home.file."battery" = {
    source = pkgs.fetchFromGitHub
      {
        owner = "richo";
        repo = "battery";
        rev = "0ea66073e9a05934de9b0658874efa96becabebd";
        sha256 = "04pc633anlw4faig6na2nl4p6jhqxw17g7m9jnz4sa8l2n768kzd";
      } + "/bin/battery";
    target = ".bin/battery";
    executable = true;
  };
}
