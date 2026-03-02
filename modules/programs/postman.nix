{ delib, pkgs, ... }:
delib.module {
  name = "postman";

  options.postman = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.postman ];
}
