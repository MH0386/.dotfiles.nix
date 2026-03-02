{ delib, ... }:
delib.module {
  name = "direnv";

  options.direnv = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.direnv =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      nix-direnv.enable = true;
    };
}
