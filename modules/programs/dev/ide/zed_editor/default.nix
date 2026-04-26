{
  den.default = {
    homeManager = {
      programs.zed-editor = {
        enable = true;
        userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
        extensions = [
          "html"
          "toml"
          "dockerfile"
          "git-firefly"
          "log"
          "docker-compose"
          "csv"
          "rainbow-csv"
          "pylsp"
          "fleet-themes"
          "mcp-server-context7"
          "basher"
          "colored-zed-icons-theme"
          "mcp-server-github"
          "python-requirements"
          "wakatime"
          "python-snippets"
          "autocorrect"
          "caddyfile"
          "json5"
          "tombi"
          "markdownlint"
          "github-actions"
          "jq"
          "jsonl"
          "desktop"
          "nix"
          "ini"
          "nu"
          "codeowners"
          "editorconfig"
          "ghostty"
          "pyrefly"
          "pytest-language-server"
          "mcp-server-brave-search"
          "just"
          "deps-language-server"
          "quarto"
          "ssh-config"
          "mermaid"
          "typst"
          "warp-one-dark"
        ];
      };
    };
  };
}
