{ delib, ... }:
delib.module {
  name = "jq";

  options.jq = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.jq = {
        inherit (cfg) enable;
      };
    };
}
