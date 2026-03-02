{ delib, pkgs, ... }:
delib.module {
  name = "pylsp";

  options.pylsp = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.python3Packages.python-lsp-server ];
}
