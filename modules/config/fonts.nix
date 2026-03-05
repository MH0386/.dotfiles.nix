{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "fonts";

  options.fonts.enable = delib.boolOption true;

  home.ifEnabled = {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      noto-fonts
      # icons
      font-awesome
      material-design-icons
    ];
  };

  nixos.ifEnabled = {
    fonts.packages = with pkgs; [ monaspace ];
    console.packages = with pkgs; [ monaspace ];
  };
}
