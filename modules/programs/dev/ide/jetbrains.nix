# Shared configuration for the JetBrains IDEs (PyCharm, RustRover).
# The plugin list and vmoptions are identical, so they are defined once here
# instead of being duplicated in a module per IDE.
{ inputs, ... }:
let
  plugins = [
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
    "com.intellij.ml.llm.experimental"
  ];

  # JetBrains run on Wayland, not XWayland.
  vmoptions = ''
    -Dawt.toolkit.name=WLToolkit
    -Dsun.java2d.uiScale.enabled=true
    -Dide.ui.scale=1.0
  '';

  ide =
    pkgs:
    {
      attr,
      dir,
      vmoptionsFile,
    }:
    {
      package = inputs.nix-jetbrains-plugins.lib.buildIdeWithPlugins pkgs attr plugins;
      vmoptionsPath = ".config/JetBrains/${dir}/${vmoptionsFile}";
    };
in
{
  den.default = {
    homeManager =
      { pkgs, lib, ... }:
      let
        pycharm = ide pkgs {
          attr = "pycharm";
          dir = "PyCharm${lib.versions.majorMinor pkgs.jetbrains.pycharm.version}";
          vmoptionsFile = "pycharm64.vmoptions";
        };
        rustRover = ide pkgs {
          attr = "rust-rover";
          dir = "RustRover${lib.versions.majorMinor pkgs.jetbrains.rust-rover.version}";
          vmoptionsFile = "rustrover64.vmoptions";
        };
      in
      {
        home.packages = [
          pycharm.package
          rustRover.package
        ];
        home.file.${pycharm.vmoptionsPath}.text = vmoptions;
        home.file.${rustRover.vmoptionsPath}.text = vmoptions;
      };
  };
}
