{ pkgs, ... }:
{
  home.packages = [
    pkgs.erlangR21
    pkgs.rebar3
  ];
}
