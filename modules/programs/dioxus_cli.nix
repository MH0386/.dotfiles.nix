{ delib, pkgs, ... }:
delib.module {
  name = "dioxus-cli";

  options.dioxus-cli = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.dioxus-cli ];
}
