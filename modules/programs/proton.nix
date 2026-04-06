{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          proton-pass
          proton-authenticator
        ];
      };
  };
}
