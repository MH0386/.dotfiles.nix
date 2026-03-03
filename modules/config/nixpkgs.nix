{ delib, ... }:
delib.module {
  name = "nixpkgs";

  options.nixpkgs = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      nixpkgs.config.allowUnfree = cfg.enable;
    };
  home.ifEnabled =
    { cfg, ... }:
    {
      home.sessionVariables."NIXPKGS_ALLOW_UNFREE" = if cfg.enable then 1 else 0;
    };
}
