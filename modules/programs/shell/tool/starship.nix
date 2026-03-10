{ delib, ... }:
delib.module {
  name = "starship";

  options.starship = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.starship = {
        inherit (cfg) enable;
        settings = {
          format = "$all";
        };
        enableBashIntegration = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableNushellIntegration = true;
      };
    };
}
