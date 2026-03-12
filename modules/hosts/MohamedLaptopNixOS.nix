{
  den.aspects.MohamedLaptopNixOS = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.hello ];
        imports = [ ./hardware-configuration.nix ];
      };
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.vim ];
      };
  };
}
