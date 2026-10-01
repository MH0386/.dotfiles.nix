{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.neovim = {
          enable = true;
          plugins = [
            pkgs.vimPlugins.vim-nix
            pkgs.vimPlugins.LazyVim
            pkgs.vimPlugins.LanguageTool-nvim
          ];
        };
      };
  };
}
