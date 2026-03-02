{ delib, ... }:
delib.module {
  name = "starship";

  options.starship = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.starship =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      settings = {
        format = "$all";
      };
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
}
