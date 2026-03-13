{ den, ... }:
{
  den.aspects.MohamedLaptopNixOS = {
    includes = [ den.provides.hostname ];
  };
}
