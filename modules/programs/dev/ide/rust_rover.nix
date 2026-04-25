{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, lib, ... }:
      let
        ideVersion = lib.versions.majorMinor pkgs.jetbrains.rust-rover.version;
        ideDir = "RustRover${ideVersion}";
        vmoptionsFile = ".config/JetBrains/${ideDir}/rustrover64.vmoptions";
      in
      {
        home = {
          packages = [
            (inputs.nix-jetbrains-plugins.lib.buildIdeWithPlugins pkgs "rust-rover" [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "mobi.hsz.idea.gitignore"
              "nix-idea"
              "com.github.xepozz.gitattributes"
              "com.aquasecurity.plugins.intellij-Trivy"
              "net.seesharpsoft.intellij.plugins.csv"
              "com.intellij.ideolog"
              "org.sonarlint.idea"
              "String Manipulation"
              "tanvd.grazi"
              "izhangzhihao.rainbow.brackets"
              "indent-rainbow.indent-rainbow"
              "com.ultrahob.zerolength.plugin"
              "com.wakatime.intellij.plugin"
              "ru.adelf.idea.dotenv"
              "com.kozhun.commit-message-template"
            ])
          ];
          file.${vmoptionsFile}.text = ''
            -Dawt.toolkit.name=WLToolkit
            -Dsun.java2d.uiScale.enabled=true
            -Dide.ui.scale=1.0
          '';
        };
      };
  };
}
