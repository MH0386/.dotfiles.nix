{ delib, ... }:
delib.module {
  name = "atuin";

  options.atuin = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.atuin =
    { cfg, ... }:
    {
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
}
