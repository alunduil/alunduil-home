{ pkgs, ... }:
{
  home.packages = [
    pkgs.cargo
    pkgs.rustfmt
  ];

  programs.vim.plugins = [ pkgs.vimPlugins.coc-rls ];
}
