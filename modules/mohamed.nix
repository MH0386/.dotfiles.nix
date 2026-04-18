{ den, ... }:
{
  den.aspects.mohamed = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      (den.provides.user-shell "zsh")
    ];
  };
  den.homes.x86_64-linux.mohamed = { };
}
