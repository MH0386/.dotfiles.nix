{ delib, ... }:
delib.module {
  name = "eza";

  options.eza = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.eza =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      colors = "always";
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      git = true;
      icons = "always";
    };
}
