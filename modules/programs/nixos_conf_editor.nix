{
  den.schema.conf = {

    homeManager =
      { inputs, pkgs, ... }:
      {
        home.packages = [
          inputs.nixos-conf-editor.packages.${pkgs.stdenv.hostPlatform.system}.nixos-conf-editor
        ];
      };
  };
}
