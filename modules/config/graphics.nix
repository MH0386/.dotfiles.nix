{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "graphics";
  # Enable OpenGL , Nouveau

  options.graphics.enable = delib.boolOption true;

  nixos.ifEnabled =
    { cfg, ... }:
    {
      hardware.graphics = {
        enable = cfg.enable;
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
}
