{ delib, ... }:
delib.module {
  name = "amberol";

  options.amberol = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      services.amberol = {
        inherit (cfg) enable;
      };
    };
}
