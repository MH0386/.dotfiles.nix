{ delib, pkgsStable, ... }:
delib.module {
  name = "obs-studio";

  options.obs-studio = with delib; {
    enable = boolOption true;
    plugins = listOption [
      pkgsStable.obs-studio-plugins.obs-backgroundremoval
      pkgsStable.obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.obs-studio = {
        inherit (cfg) enable;
        inherit (cfg) plugins;
      };
    };
}
