{ delib, pkgsStable, ... }:
delib.module {
  name = "livecaptions";

  options.livecaptions = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgsStable.livecaptions ];
}
