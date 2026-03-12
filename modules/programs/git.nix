{
  den.schema.conf = {
    homeManager =
      { pkgsStable, pkgs, ... }:
      {
        programs.git = {
          enable = true;
          lfs.enable = true;
          package = pkgsStable.git;
          settings = {
            user = {
              name = "Mohamed Hisham Abdelzaher";
              email = "mohamed.hisham.abdelzaher@gmail.com";
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
  };
}
