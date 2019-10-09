{ pkgs, ... }:
{
  home.packages = [
    pkgs.cargo
    pkgs.rls
    pkgs.rustfmt
  ];
}
