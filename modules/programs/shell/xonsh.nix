{ delib, ... }:
delib.module {
  name = "xonsh";

  options.xonsh = with delib; {
    enable = boolOption true;
    config = strOption "execx($(atuin init xonsh))";
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.xonsh = {
        inherit (cfg) enable;
        inherit (cfg) config;
      };
    };
}
