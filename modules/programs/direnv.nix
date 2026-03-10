{ delib, ... }:
delib.module {
  name = "direnv";

  options.direnv = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.direnv = {
        inherit (cfg) enable;
        nix-direnv.enable = true;
      };
    };
}
