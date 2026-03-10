{ delib, ... }:
delib.module {
  name = "eza";

  options.eza = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.eza = {
        inherit (cfg) enable;
        colors = "always";
        enableBashIntegration = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableNushellIntegration = true;
        git = true;
        icons = "always";
      };
    };
}
