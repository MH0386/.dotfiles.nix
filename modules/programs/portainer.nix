{ delib, inputs, ... }:
delib.module {
  name = "portainer";

  options.portainer = with delib; {
    enable = boolOption true;
    version = strOption "latest";
    openFirewall = boolOption true;
    port = portOption 9443;
  };

  nixos.always.imports = [ inputs.portainer-on-nixos.nixosModules.portainer ];
  nixos.ifEnabled =
    { cfg, ... }:
    {
      services.portainer = {
        inherit (cfg) enable;
        inherit (cfg) version;
        inherit (cfg) openFirewall;
        inherit (cfg) port;
      };
    };
}
