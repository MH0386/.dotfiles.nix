{
  inputs,
  den,
  lib,
  ...
}:
{
  imports = [ inputs.den.flakeModule ];

  den.ctx.user.classes = lib.mkDefault [ "homeManager" ];

  den.hosts.x86_64-linux.MohamedLaptopNixOS.users.mohamed = { };

  den.aspects.MohamedLaptopNixOS = {
    includes = [ den.provides.hostname ];
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.hello ];
      };
  };

  den.aspects.mohamed = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
    ];
    homeManager =
      { pkgs, ... }:
      {
        packages = [ pkgs.vim ];
      };
  };
}
