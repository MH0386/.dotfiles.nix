{
  delib,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "zen-browser";

  options.zen-browser = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
