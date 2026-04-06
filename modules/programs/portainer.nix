{ inputs, ... }:
{
  den.default = {
    nixos = {
      imports = [ inputs.portainer-on-nixos.nixosModules.portainer ];
      services.portainer = {
        enable = true;
        version = "latest";
        openFirewall = true;
        port = 9443;
      };
    };
  };
}
