{
  den.default = {
    nixos = {
      services.hypridle.enable = true;
      programs = {
        hyprland.enable = true;
        iio-hyprland.enable = true;
      };
    };
    homeManager = { };
  };
}
