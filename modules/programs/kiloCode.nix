{
  den.schema.conf = {
    homeManager =
      { inputs, pkgs, ... }:
      {
        home.packages = [
          inputs.kilocode.packages.${pkgs.stdenv.hostPlatform.system}.kilo
          # inputs.kilocode.packages.${pkgs.stdenv.hostPlatform.system}.desktop
        ];
      };
  };
}
