{ delib, ... }:
delib.module {
  name = "uv";

  options.uv = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.uv =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
