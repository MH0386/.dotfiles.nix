{ den, ... }:
{
  den.aspects.MohamedDesktopNixOS = {
    includes = [ den.provides.hostname ];
    nixos.imports = [ ./hardware-configuration.nix ];
  };
}
