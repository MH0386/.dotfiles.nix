{
  den.default = {
    nixos.services.avahi = {
      enable = true;
      publish.enable = true;
    };
  };
}
