{ delib, ... }:
delib.module {
  name = "nh";

  options.nh = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.nh = {
        inherit (cfg) enable;
        flake = "/home/mohamed/.dotfiles";
        clean = {
          enable = true;
          extraArgs = "--keep 5";
        };
      };
    };
}
