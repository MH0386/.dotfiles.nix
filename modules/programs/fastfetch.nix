{ delib, ... }:
delib.module {
  name = "fastfetch";

  options.fastfetch = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.fastfetch = {
        inherit (cfg) enable;
      };
    };
}
