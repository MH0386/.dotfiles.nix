{
  den.default = {
    includes = [
      # den.provides.define-user
      # den.provides.hostname
    ];
    nixos = {
      system.stateVersion = "26.05";
      environment = {
        localBinInPath = true;
        homeBinInPath = true;
      };
    };
    homeManager =
      { pkgs, pkgsStable, ... }:
      {
        home = {
          stateVersion = "25.11";
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
