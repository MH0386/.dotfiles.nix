{ delib, pkgs, ... }:
delib.module {
  name = "copilot";

  options.copilot = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.github-copilot-cli ];
}
