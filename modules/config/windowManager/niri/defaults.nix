{
  den.default = {
    nixos = {
      programs.niri.enable = true;
      services.iio-niri.enable = true;
    };
    homeManager.programs.niri.enable = true;
  };
}
