{
  den.schema.conf = {

    homeManager =
      { inputs, pkgs, ... }:
      {
        home.packages = [
          inputs.nix-software-center.packages.${pkgs.stdenv.hostPlatform.system}.nix-software-center
        ];
      };
  };
}
