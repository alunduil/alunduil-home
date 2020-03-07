{ pkgs, ... }:
{
  home.packages = [
    pkgs.erlang
    pkgs.rebar3
  ];
}
