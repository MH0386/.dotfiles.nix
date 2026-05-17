{ inputs, ... }:
{
  den.default = {
    homeManager = {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia-shell = {
        enable = true;
        settings = {
          # configure noctalia here
          bar = {
            density = "compact";
            position = "right";
            showCapsule = false;
            widgets = {
              left = [
                {
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
                { id = "Network"; }
                { id = "Bluetooth"; }
              ];
              center = [
                {
                  hideUnoccupied = false;
                  id = "Workspace";
                  labelMode = "none";
                }
              ];
              right = [
                {
                  alwaysShowPercentage = false;
                  id = "Battery";
                  warningThreshold = 30;
                }
                {
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm";
                  id = "Clock";
                  useMonospacedFont = true;
                  usePrimaryColor = true;
                }
              ];
            };
          };
          colorSchemes.predefinedScheme = "Monochrome";
          general = {
            # avatarImage = "/home/drfoobar/.face";
            radiusRatio = 0.2;
          };
          location = {
            monthBeforeDay = true;
            name = "Cairo, Egypt";
          };
        };
        plugins = {
          sources = [
            {
              enabled = true;
              name = "Official Noctalia Plugins";
              url = "https://github.com/noctalia-dev/noctalia-plugins";
            }
          ];
          states = {
            catwalk = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
          };
          version = 2;
        };
        # this may also be a string or a path to a JSON file.

        pluginSettings = {
          catwalk = {
            minimumThreshold = 25;
            hideBackground = true;
          };
          # this may also be a string or a path to a JSON file.
        };
      };
    };
  };
}
