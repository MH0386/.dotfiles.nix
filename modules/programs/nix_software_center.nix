{
  delib,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "nix-software-center";

  options.nix-software-center = with delib; {
    enable = boolOption false;
  };

  home.ifEnabled.home.packages = [
    inputs.nix-software-center.packages.${pkgs.stdenv.hostPlatform.system}.nix-software-center
  ];
}
