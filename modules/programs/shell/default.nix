{ delib, pkgs, ... }:
delib.module {
  name = "shell";

  home.always.home = {
    packages = with pkgs; [ undollar ];
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      l = "ls";
      c = "clear";
      h = "history";
    };
  };
}
