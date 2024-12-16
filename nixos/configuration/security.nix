{ ... }:
{
  security.apparmor = {
    enable = true;
    policies.dummy.profile = ''
      /dummy {
      }
    '';
  };
}
