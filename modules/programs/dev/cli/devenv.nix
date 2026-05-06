{
  den.default = {
    homeManager =
      { pkgs, lib, ... }:
      {
        home.packages = [ pkgs.devenv ];
        programs.zsh.initContent = ''
          eval "$(${lib.getExe pkgs.devenv} hook zsh)"
        '';
      };
  };
}
