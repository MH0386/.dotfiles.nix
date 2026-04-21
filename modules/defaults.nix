{ den, ... }:
{
  den.default = {
    includes = [
      den.provides.gdm
      # den.provides.define-user
      # den.provides.hostname
    ];
    nixos = {
      system.stateVersion = "26.05";
      environment = {
        localBinInPath = true;
        homeBinInPath = true;
      };
      services.xserver.enable = true;
    };
    homeManager =
      { pkgs, pkgsStable, ... }:
      {
        programs.home-manager.enable = true;
        home = {
          stateVersion = "26.05";
          packages =
            (with pkgs; [
              gnumake
              ntfs3g
              gcc
              cmake
              unzip
              zip
              wget
              lshw-gui
              ignition
            ])
            ++ (with pkgsStable; [
              fh
            ]);
          file = { };
          sessionPath = [ ];
          sessionVariables = { };
        };
      };
  };
}
