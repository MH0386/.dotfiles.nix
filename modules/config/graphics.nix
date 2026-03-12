{
  # Enable OpenGL , Nouveau
  den.schema.conf = {
    nixos =
      { pkgs, ... }:
      {
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = with pkgs; [
            intel-media-driver
            intel-ocl
            intel-vaapi-driver
          ];
          extraPackages32 = with pkgs.pkgsi686Linux; [
            intel-media-driver
            intel-vaapi-driver
          ];
        };
      };
  };
}
