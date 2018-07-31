{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnupg
  ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };
}
