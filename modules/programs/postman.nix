{ delib, pkgs, ... }:
delib.module {
  name = "postman";

  options.postman = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.postman ];
}
