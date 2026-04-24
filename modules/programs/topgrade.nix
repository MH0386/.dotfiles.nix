{
  den.default = {
    homeManager.programs.topgrade = {
      enable = true;
      settings = {
        misc = {
          assume_yes = true;
          disable = [ "nix" ];
        };
      };
    };
  };
}
