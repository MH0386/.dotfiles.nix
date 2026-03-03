{ delib, pkgs, ... }:
delib.module {
  name = "fedora_media_writer";

  options.fedora_media_writer = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.mediawriter ];
}
