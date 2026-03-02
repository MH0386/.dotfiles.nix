{ delib, ... }:
delib.module {
  name = "zramSwap";

  nixos.always.zramSwap.enable = true;
}
