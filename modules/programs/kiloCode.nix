{
  delib,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "kiloCode";

  options.kiloCode = with delib; {
    enable = boolOption false;
  };

  home.ifEnabled.home.packages = [
    inputs.kilocode.packages.${pkgs.stdenv.hostPlatform.system}.kilo
    # inputs.kilocode.packages.${pkgs.stdenv.hostPlatform.system}.desktop
  ];
}
