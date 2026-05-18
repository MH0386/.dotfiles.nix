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
              "Mod+Space" = {
                action.spawn = [
                  "vicinae"
                  "toggle"
                ];
                repeat = false;
              };
              "Mod+S".action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "settings"
                "toggle"
              ];
              "Mod+L".action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "sessionMenu"
                "toggle"
              ];
              "Mod+Shift+L".action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "lockScreen"
                "lock"
              ];
              XF86AudioRaiseVolume.action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "volume"
                "increase"
              ];
              XF86AudioLowerVolume.action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "volume"
                "decrease"
              ];
              XF86AudioMute.action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "volume"
                "muteOutput"
              ];
              XF86MonBrightnessUp.action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "brightness"
                "increase"
              ];
              XF86MonBrightnessDown.action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "brightness"
                "decrease"
              ];
            };
            spawn-at-startup = [
              {
                argv = [
                  "vicinae"
                  "server"
                ];
              }
              {
                command = [ "noctalia-shell" ];
              }
            ];
          };
        };
      };
  };
}
