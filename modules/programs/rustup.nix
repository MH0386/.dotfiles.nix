{ delib, pkgs, ... }:
delib.module {
  name = "rustup";

  options.rustup = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.rustup ];
}
