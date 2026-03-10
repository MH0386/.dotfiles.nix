{ delib, ... }:
delib.module {
  name = "helix";

  options.helix = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.helix = {
        inherit (cfg) enable;
      };
    };
}
