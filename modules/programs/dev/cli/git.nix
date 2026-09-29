{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.git = {
          enable = true;
          lfs.enable = true;
          settings = {
            user = {
              name = "Mohamed Hisham Abdelzaher";
              email = "mohamed.hisham.abdelzaher@gmail.com";
            };
            pull.rebase = false;
            push.autoSetupRemote = true;
            init.defaultBranch = "main";
          };
        };
        home.packages = [
          pkgs.git-filter-repo
          pkgs.git-xet
        ];
      };
  };
}
