{ den, ... }:
{
  den.aspects.MohamedLaptopNixOS = {
    includes = [ den.provides.hostname ];
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.hello ];
        imports = [ ../../nixos/hardware-configuration.nix ];
      };
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.vim ];
      };
  };
}
