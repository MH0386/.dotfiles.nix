{ delib, ... }:
delib.module {
  name = "vscode";

  options.vscode = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.vscode = {
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
    };
}
