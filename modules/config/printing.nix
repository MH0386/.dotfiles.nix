{ delib, ... }:
delib.module {
  name = "printing";
  # Enable CUPS to print documents.

  options.printing = with delib; {
    enable = singleEnableOption true;
  };

  nixos.ifEnabled.services.printing =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
