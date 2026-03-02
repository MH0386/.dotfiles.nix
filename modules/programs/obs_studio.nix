{ delib, pkgsStable, ... }:
delib.module {
  name = "obs-studio";

  options.obs-studio = with delib; {
    enable = singleEnableOption true;
    plugins = listOptionOf plugin [
      pkgsStable.obs-studio-plugins.obs-backgroundremoval
      pkgsStable.obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };

  home.ifEnabled.programs.obs-studio =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      inherit (cfg) plugins;
    };
}
