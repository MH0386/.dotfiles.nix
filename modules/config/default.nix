{
  delib,
  pkgs,
  pkgsStable,
  ...
}:
delib.module {
  name = "base";

  nixos.always = {
    environment = {
      localBinInPath = true;
      homeBinInPath = true;
      systemPackages =
        (with pkgs; [
          gnumake
          ntfs3g
          gcc
          clang
          cmake
          glib
          unzip
          zip
          wget
          lshw-gui
          ignition
        ])
        ++ (with pkgsStable; [ fh ]);
    };
  };

  home.always.home = {
    file = { };
    sessionPath = [ ];
    sessionVariables = { };
  };
}
