{ delib, ... }:
delib.module {
  name = "nh";

  options.nh = with delib; {
    enable = singleEnableOption true;
  };

  nixos.ifEnabled.programs.nh =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      flake = "/home/mohamed/.dotfiles";
      clean = {
        enable = true;
        extraArgs = "--keep 5";
      };
    };
}
