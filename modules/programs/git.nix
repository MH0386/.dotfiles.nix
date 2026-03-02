{ delib, pkgs, ... }:
delib.module {
  name = "programs.git";

  options.programs.git = with delib; {
    enable = boolOption true;
    enableLFS = boolOption true;
  };

  home.ifEnabled =
    { myconfig, cfg, ... }:
    {
      programs.git = {
        inherit (cfg) enable;
        lfs.enable = cfg.enableLFS;
        # package = pkgsStable.git;
        settings = {
          user = {
            name = myconfig.constants.username;
            email = myconfig.constants.useremail;
          };
          pull.rebase = false;
          init.defaultBranch = "main";
        };
      };
      home.packages = with pkgs; [
        git-filter-repo
        git-xet
      ];
    };
}
