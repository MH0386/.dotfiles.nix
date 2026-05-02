{ inputs, ... }:
{
  den.default = {
    nixos.imports = [ inputs.nur.modules.nixos.default ];
    homeManager.imports = [ inputs.nur.modules.homeManager.default ];
  };
}
