{ delib, ... }:
delib.module {
  name = "fd";

  options.fd = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.fd = {
        inherit (cfg) enable;
      };
    };
}
