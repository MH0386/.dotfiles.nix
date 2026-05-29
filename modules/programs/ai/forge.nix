{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.forge ];
        programs.zsh.initContent = ''
          # Load forge shell plugin (commands, completions, keybindings) if not already loaded
          if [[ -z "$_FORGE_PLUGIN_LOADED" ]]; then
              eval "$(forge zsh plugin)"
          fi

          # Load forge shell theme (prompt with AI context) if not already loaded
          if [[ -z "$_FORGE_THEME_LOADED" ]]; then
              eval "$(forge zsh theme)"
          fi
        '';
      };
  };
}
