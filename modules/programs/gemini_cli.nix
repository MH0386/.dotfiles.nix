{ delib, ... }:
delib.module {
  name = "gemini-cli";

  options.gemini-cli = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.gemini-cli = {
        inherit (cfg) enable;
      };
    };
}
