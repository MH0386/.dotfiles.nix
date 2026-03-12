{
  inputs,
  den,
  lib,
  ...
}:
{
  imports = [ inputs.den.flakeModule ];

  den.ctx.user.classes = lib.mkDefault [ "homeManager" ];
}
