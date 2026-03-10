{
  delib,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "nixos-conf-editor";

  options.nixos-conf-editor = with delib; {
    enable = boolOption false;
  };

  home.ifEnabled.home.packages = [
    inputs.nixos-conf-editor.packages.${pkgs.stdenv.hostPlatform.system}.nixos-conf-editor
  ];
}
