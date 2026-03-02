{ delib, pkgs, ... }:
delib.module {
  name = "fedora_media_writer";

  options.fedora_media_writer = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.mediawriter ];
}
