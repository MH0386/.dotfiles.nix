{ delib, ... }:
delib.module {
  name = "yt-dlp";

  options.yt-dlp = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.yt-dlp = {
        inherit (cfg) enable;
      };
    };
}
