{ delib, ... }:
delib.module {
  name = "gemini-cli";

  options.gemini-cli = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.gemini-cli =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
