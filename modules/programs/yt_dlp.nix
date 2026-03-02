{ delib, ... }:
delib.module {
  name = "yt-dlp";

  options.yt-dlp = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.yt-dlp =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
