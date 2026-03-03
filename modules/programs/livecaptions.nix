{ delib, pkgsStable, ... }:
delib.module {
  name = "livecaptions";

  options.livecaptions = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgsStable.livecaptions ];
}
