{ delib, ... }:
delib.module {
  name = "atuin";

  options.atuin = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.atuin = {
        inherit (cfg) enable;
        daemon.enable = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
        enableZshIntegration = true;
        settings = {
          style = "auto";
        };
      };
    };
}
