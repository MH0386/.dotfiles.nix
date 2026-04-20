{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.neovim = {
          enable = true;
          plugins = with pkgs.vimPlugins; [
            vim-nix
            LazyVim
            LanguageTool-nvim
          ];
        };
      };
  };
}
