{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.libreoffice
          pkgs.hunspell
          pkgs.hunspellDicts.en_US-large
        ];
      };
  };
}
