{ pkgs, ... }:
{
  home.packages = [
    pkgs.solargraph
  ];

  programs.vim.plugins = [pkgs.vimPlugins.coc-solargraph];
}
