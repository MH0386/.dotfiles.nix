{
  den.default = {
    nixos =
      { pkgs, ... }:
      {
        nixpkgs = {
          overlays = [
            (_final: prev: {
              inherit (prev.lixPackageSets.stable)
                nixpkgs-review
                nix-eval-jobs
                nix-fast-build
                colmena
                nix-tree
                nixfmt
                nixd
                nil
                nix-diff
                ;
            })
          ];
        };
        nix.package = pkgs.lixPackageSets.stable.lix;
      };
  };
}
