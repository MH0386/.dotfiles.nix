{ den, ... }:
{
  den.aspects.MohamedDesktopNixOS = {
    includes = [ den.provides.hostname ];
    nixos.imports = [ ./_hardware-configuration.nix ];
  };
}
