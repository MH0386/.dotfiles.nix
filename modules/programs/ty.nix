{ delib, ... }:
delib.module {
  name = "ty";

  options.ty = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.ty = {
        inherit (cfg) enable;
      };
    };
}
