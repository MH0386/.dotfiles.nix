{ den, ... }:
{
  den.aspects.MohamedLaptopNixOS = {
    includes = [ den.provides.hostname ];
    nixos.imports = [ ./_hardware-configuration.nix ];
  };
}
