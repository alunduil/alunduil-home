{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 2;
          y = 2;
        };
        dynamic_padding = true;
      };
      scrolling.history = 0;
      font = {
        normal.family = "Noto Sans Mono";
        size = 5;
      };
      colors = {
        primary = {
          background = "0x002b36"; # base03
          foreground = "0x839496"; # base0
        };
        normal = {
          black = "0x073642"; # base02
          red = "0xdc322f";
          green = "0x859900";
          yellow = "0xb58900";
          blue = "0x268bd2";
          magenta = "0xd33682";
          cyan = "0x2aa198";
          white = "0xeee8d5"; #base2
        };
        bright = {
          black = "0x002b36"; # base03
          red = "0xcb4b16"; # orange
          green = "0x586e75"; # base01
          yellow = "0x657b83"; # base00
          blue = "0x839496"; # base0
          magenta = "0x6c71c4"; # violet
          cyan = "0x93a1a1"; # base1
          white = "0xfdf6e3"; # base3
        };
      };
      bell.color = "0xfdf6e3"; # base3
      selection.save_to_clipboard = true;
      alt_send_esc = true; # TODO xmonad compatible?
    };
  };
}
