{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          inputs.nix-editor.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };
  };
}
