{ delib, ... }:
delib.module {
  name = "carapace";

  options.carapace = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.carapace = {
        inherit (cfg) enable;
        enableBashIntegration = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableNushellIntegration = true;
      };
    };
}
