{ delib, pkgs, ... }:
delib.module {
  name = "copilot";

  options.copilot = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.github-copilot-cli ];
}
