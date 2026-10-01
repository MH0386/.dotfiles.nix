{ den, ... }:
{
  den.default = {
    includes = [
      den.provides.dmsGreeter
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
      users.users.mohamed.extraGroups = [
        "render"
        "video"
        "wheel"
        "adbusers"
      ];
      home-manager = {
        # useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        verbose = true;
      };
    };
    homeManager =
      { pkgs, pkgsStable, ... }:
      {
        programs.home-manager.enable = true;
        home = {
          stateVersion = "26.05";
          packages = [
            pkgs.gnumake
            pkgs.ntfs3g
            pkgs.gcc
            pkgs.cmake
            pkgs.unzip
            pkgs.zip
            pkgs.wget
            pkgs.lshw-gui
            pkgs.ignition
          ]
          ++ [
            pkgsStable.fh
            pkgsStable.renameutils
          ];
        };
      };
  };
}
