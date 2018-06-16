{ pkgs, ... }:
{
  xresources = {
    extraConfig = builtins.readFile (
      pkgs.fetchFromGitHub {
        owner = "solarized";
        repo = "xresources";
        rev = "025ceddbddf55f2eb4ab40b05889148aab9699fc";
        sha256 = "0lxv37gmh38y9d3l8nbnsm1mskcv10g3i83j0kac0a2qmypv1k9f";
      } + "/Xresources.dark"
    );
    properties = {
      "URxvt.font" = "xft:DejaVu Sans Mono:size=6.5:antialias=true";
      "URxvt.boldFont" = "xft:DejaVu Sans Mono-Bold:size=6.5:antialias=true";
      "URxvt.italicFont" = "xft:DejaVu Sans Mono-Oblique:size=6.5:antialias=true";
      "URxvt.boldItalicFont" = "xft:DejaVu Sans Mono-BoldOblique:size=6.5:antialias=true";

      "URxvt.geometry" = "140x40";
      "URxvt.letterSpace" = 1;

      "URxvt.scrollBar" = false;
      "URxvt.scrollBar_right" = false;
      "URxvt.scrollBar_left" = false;
      "URxvt.scrollTtyKeypress" = true;

      "URxvt.perl-ext-common" = "default,selection-to-clipboard,clipboard,matcher";
      "URxvt.matcher.button" = 1;
      "URxvt.url-launcher" = "/run/current-system/sw/bin/xdg-open";
      "URxvt.keysym.Control-Shift-c" = "perl:clipboard:copy";
      "URxvt.keysym.Control-Shift-v" = "perl:clipboard:paste";

      "URxvt.*iso14755" = false;
    };
  };
}
