{ delib, pkgs, ... }:
delib.module {
  name = "ffmpeg";

  options.ffmpeg = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.ffmpeg ];
}
