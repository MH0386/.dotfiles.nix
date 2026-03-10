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
    };
  };

  home.always.home = {
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
}
