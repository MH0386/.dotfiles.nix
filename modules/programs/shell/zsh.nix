{ delib, ... }:
delib.module {
  name = "zsh";

  options.zsh = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.zsh = {
        inherit (cfg) enable;
      };
    };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.zsh = {
        inherit (cfg) enable;
        autosuggestion.enable = true;
      };
    };
}
