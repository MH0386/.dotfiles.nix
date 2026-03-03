{ delib, ... }:
delib.module {
  name = "uv";

  options.uv = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.uv = {
        inherit (cfg) enable;
      };
    };
}
