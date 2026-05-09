{ inputs, ... }:
{
  den.default = {
    nixos = {
      programs.niri.enable = true;
      services.iio-niri.enable = true;
    };
    homeManager =
      { pkgs, ... }:
      {
        imports = [
          inputs.stylix.homeModules.stylix
          inputs.niri.homeModules.niri
          inputs.niri.homeModules.stylix
        ];
        stylix = {
          polarity = "dark";
        };
        programs.niri = {
          enable = true;
          package = pkgs.niri;
          settings = {
            binds = {
              "Alt+Space" = {
                action.spawn = [
                  "vicinae"
                  "toggle"
                ];
                repeat = false;
              };
            };
            spawn-at-startup = [
              {
                argv = [
                  "vicinae"
                  "server"
                ];
              }
            ];
          };
        };
      };
  };
}
