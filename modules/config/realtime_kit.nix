{ delib, ... }:
delib.module {
  name = "realtime_kit";

  nixos.always.security.rtkit.enable = true;
}
