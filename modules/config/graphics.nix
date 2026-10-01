{
  # Enable OpenGL , Nouveau
  den.default = {
    nixos =
      { pkgs, ... }:
      {
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = [
            pkgs.intel-media-driver
            pkgs.intel-ocl
            pkgs.intel-vaapi-driver
          ];
          extraPackages32 = [
            pkgs.pkgsi686Linux.intel-media-driver
            pkgs.pkgsi686Linux.intel-vaapi-driver
          ];
        };
      };
  };
}
