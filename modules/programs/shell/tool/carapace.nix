{ delib, ... }:
delib.module {
  name = "carapace";

  options.carapace = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.carapace =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
}
