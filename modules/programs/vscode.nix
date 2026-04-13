{
  den.default = {
    homeManager =
      { config, lib, ... }:
      {
        home.sessionVariables = {
          EDITOR = "${lib.getExe config.programs.vscode.package} --wait";
        };
        programs.vscode = {
          enable = true;
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
  };
}
