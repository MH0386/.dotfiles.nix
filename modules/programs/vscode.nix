{ delib, ... }:
delib.module {
  name = "vscode";

  options.vscode = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.vscode =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      profiles = {
        default = {
          enableMcpIntegration = true;
          # userSettings = {
          #   editor = {
          #     fontSize = 14;
          #     fontFamily = "Fira Code";
          #   };
          # };
        };
      };
    };
}
