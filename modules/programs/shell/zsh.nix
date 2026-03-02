{ delib, ... }:
delib.module {
  name = "zsh";

  options.zsh = with delib; {
    enable = singleEnableOption true;
  };

  nixos.ifEnabled.programs.zsh =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };

  home.ifEnabled.programs.zsh =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      autosuggestion.enable = true;
    };
}
