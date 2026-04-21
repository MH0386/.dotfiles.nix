{ inputs, ... }:
{
  den.default = {
    nixos = {
      programs.niri.enable = true;
      services.iio-niri.enable = true;
    };
    homeManager = {
      imports = [ inputs.niri.homeModules.niri ];
      programs.niri.enable = true;
    };
  };
}
