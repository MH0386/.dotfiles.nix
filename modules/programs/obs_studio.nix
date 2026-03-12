{
  den.schema.conf = {
    homeManager =
      { pkgsStable, ... }:
      {
        programs.obs-studio = {
          enable = true;
          plugins = with pkgsStable.obs-studio-plugins; [
            obs-backgroundremoval
            obs-pipewire-audio-capture
          ];
        };
      };
  };
}
