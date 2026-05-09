{ den, ... }:
{
  den = {
    hosts.x86_64-linux = {
      MohamedLaptopNixOS.users.mohamed = { };
      MohamedDesktopNixOS.users.mohamed = { };
    };
    aspects = {
      MohamedLaptopNixOS = {
        includes = [ den.provides.hostname ];
        nixos.imports = [ ./hosts/MohamedLaptopNixOS/_hardware-configuration.nix ];
      };
      MohamedDesktopNixOS = {
        includes = [ den.provides.hostname ];
        nixos.imports = [ ./hosts/MohamedDesktopNixOS/_hardware-configuration.nix ];
      };
    };
  };
}
