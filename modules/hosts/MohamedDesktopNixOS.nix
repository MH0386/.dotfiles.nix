{ den, ... }:
{
  den.aspects.MohamedDesktopNixOS = {
    includes = [ den.provides.hostname ];
  };
}
