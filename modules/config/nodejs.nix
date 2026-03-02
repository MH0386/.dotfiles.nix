{ delib, pkgs, ... }:
delib.module {
  name = "nodejs";

  options.nodejs = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.bun.enable = cfg.enable;
      home.packages = with pkgs; [
        nodejs_22
        corepack
      ];
    };
}
