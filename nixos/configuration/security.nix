{ ... }:
{
  security = {
    rtkit.enable = true;
    apparmor = {
      enable = true;
      policies.dummy.profile = ''
        /dummy {
        }
      '';
    };
  };
}
