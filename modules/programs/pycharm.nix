{
  delib,
  pkgs,
  nix-jetbrains-plugins,
  ...
}:
delib.module {
  name = "pycharm";

  options.pycharm = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.pycharm [
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."org.jetbrains.junie"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.intellij.ml.llm"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."mobi.hsz.idea.gitignore"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."nix-idea"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.github.xepozz.gitattributes"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.aquasecurity.plugins.intellij-Trivy"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."net.seesharpsoft.intellij.plugins.csv"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.intellij.ideolog"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."org.sonarlint.idea"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."sourcery.pycharm-plugin"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."String Manipulation"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."tanvd.grazi"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."izhangzhihao.rainbow.brackets"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."indent-rainbow.indent-rainbow"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.ultrahob.zerolength.plugin"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.wakatime.intellij.plugin"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."ru.adelf.idea.dotenv"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.github.copilot"
      nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.kozhun.commit-message-template"
    ])
  ];
}
