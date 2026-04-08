{
  den.provides = {
    gdm = {
      nixos.services.displayManager.gdm.enable = true;
      homeManager =
        { pkgs, ... }:
        {
          home.packages = [ pkgs.gdm-settings ];
        };
    };
    dmsGreeter = {
      nixos.services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";

        # Sync your user's DankMaterialShell theme with the greeter.
        # You'll probably want this
        configHome = "/home/mohamed";

        # Save the logs to a file
        logs = {
          save = true;
          path = "/tmp/dms-greeter.log";
        };
      };
    };
  };
}
