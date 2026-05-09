{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, lib, ... }:
      let
        ideVersion = lib.versions.majorMinor pkgs.jetbrains.pycharm.version;
        ideDir = "PyCharm${ideVersion}";
        vmoptionsFile = ".config/JetBrains/${ideDir}/pycharm64.vmoptions";
      in
      {
        home = {
          packages = [
            (inputs.nix-jetbrains-plugins.lib.buildIdeWithPlugins pkgs "pycharm" [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "mobi.hsz.idea.gitignore"
              "nix-idea"
              "com.github.xepozz.gitattributes"
              "com.aquasecurity.plugins.intellij-Trivy"
              "net.seesharpsoft.intellij.plugins.csv"
              "com.intellij.ideolog"
              "org.sonarlint.idea"
              # "sourcery.pycharm-plugin"
              "String Manipulation"
              "tanvd.grazi"
              "izhangzhihao.rainbow.brackets"
              "indent-rainbow.indent-rainbow"
              "com.ultrahob.zerolength.plugin"
              "com.wakatime.intellij.plugin"
              "ru.adelf.idea.dotenv"
              "com.kozhun.commit-message-template"
              "com.intellij.ml.llm.experimental"
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
