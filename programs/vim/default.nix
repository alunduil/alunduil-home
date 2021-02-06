{ pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
  ];

  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ./vimrc;
    plugins = [
      pkgs.vimPlugins.coc-git
      pkgs.vimPlugins.coc-json
      pkgs.vimPlugins.coc-python
      pkgs.vimPlugins.coc-yaml
      pkgs.vimPlugins.plantuml-syntax
      pkgs.vimPlugins.vim-airline
      pkgs.vimPlugins.vim-better-whitespace
      pkgs.vimPlugins.vim-colorschemes
      pkgs.vimPlugins.vim-lastplace
      pkgs.vimPlugins.vim-signify
      pkgs.vimPlugins.vim-sort-motion
    ];
    settings = {
      background = "dark";
      hidden = true;
      history = 1000;
      smartcase = true;
      tabstop = 8;
    };
  };
}
