{
  den.schema.conf = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          kubernetes
          kubectl
          kompose
        ];
      };
  };
}
