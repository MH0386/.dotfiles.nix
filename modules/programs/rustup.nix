{ delib, pkgs, ... }:
delib.module {
  name = "rustup";

  options.rustup = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.rustup ];
}
