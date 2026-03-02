{ delib, pkgs, ... }:
delib.module {
  name = "nushell";

  options.nushell = with delib; {
    enable = boolOption true;
    plugins = listOptionOf plugin [ pkgs.nushellPlugins.gstat ];
  };

  home.ifEnabled.programs.nushell =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      inherit (cfg) plugins;
    };
}
