{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        programs.obs-studio = {
          enable = true;
          plugins = [
            pkgsStable.obs-studio-plugins.obs-backgroundremoval
            pkgsStable.obs-studio-plugins.obs-pipewire-audio-capture
          ];
        };
      };
  };
}
