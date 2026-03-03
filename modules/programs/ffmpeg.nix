{ delib, pkgs, ... }:
delib.module {
  name = "ffmpeg";

  options.ffmpeg = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.ffmpeg ];
}
