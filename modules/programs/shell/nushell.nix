{ delib, pkgs, ... }:
delib.module {
  name = "nushell";

  options.nushell = with delib; {
    enable = boolOption true;
    plugins = listOption [ pkgs.nushellPlugins.gstat ];
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nushell = {
        inherit (cfg) enable;
        inherit (cfg) plugins;
      };
    };
}
