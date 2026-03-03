{ delib, ... }:
delib.module {
  name = "vesktop";

  options.vesktop = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.vesktop = {
        inherit (cfg) enable;
      };
    };
}
