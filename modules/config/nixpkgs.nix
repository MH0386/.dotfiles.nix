{
  den.schema.conf = {
    nixos.nixpkgs = {
      config.allowUnfree = true;
      overlays = [
        (final: prev: {
          inherit (prev.lixPackageSets.stable)
            nixpkgs-review
            nix-eval-jobs
            nix-fast-build
            colmena
            ;
        })
      ];
    };
    homeManager.nixpkgs.config.allowUnfree = true;
  };
}
