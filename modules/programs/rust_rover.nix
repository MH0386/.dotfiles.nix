{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.rust-rover [
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."org.jetbrains.junie"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.intellij.ml.llm"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."mobi.hsz.idea.gitignore"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."nix-idea"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.github.xepozz.gitattributes"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.aquasecurity.plugins.intellij-Trivy"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."net.seesharpsoft.intellij.plugins.csv"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.intellij.ideolog"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."org.sonarlint.idea"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."String Manipulation"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."tanvd.grazi"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."izhangzhihao.rainbow.brackets"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."indent-rainbow.indent-rainbow"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.ultrahob.zerolength.plugin"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.wakatime.intellij.plugin"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."ru.adelf.idea.dotenv"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.github.copilot"
            inputs.nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.kozhun.commit-message-template"
          ])
        ];
      };
  };
}
