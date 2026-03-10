{ delib, ... }:
delib.module {
  name = "printing";
  # Enable CUPS to print documents.

  options.printing = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      services.printing = {
        inherit (cfg) enable;
      };
    };
}
