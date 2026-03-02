{ delib, ... }:
delib.module {
  name = "dms-greeter";

  options.dms-greeter = with delib; {
    enable = boolOption host.dmsGreeterFeatured;
    compositor.name = enumOption [ "niri" "hyprland" "sway" ] "niri";
    logs = {
      save = boolOption true;
      path = strOption "/tmp/dms-greeter.log";
    };
  };

  nixos.ifEnabled.services.displayManager.dms-greeter =
    { myconfig, cfg, ... }:
    {
      inherit (cfg) enable;
      compositor.name = cfg.compositor.name;

      # Sync your user's DankMaterialShell theme with the greeter. You'll probably want this
      configHome = "/home/${myconfig.constants.username}";

      # Save the logs to a file
      logs = {
        inherit (cfg.logs) save;
        inherit (cfg.logs) path;
      };
    };
}
