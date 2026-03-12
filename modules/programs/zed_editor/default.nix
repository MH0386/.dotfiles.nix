{
  den.schema.conf = {
    homeManager = {
      programs.zed-editor = {
        enable = true;
        userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
        extensions = [
          "html"
          "toml"
          "dockerfile"
          "git-firefly"
          "github-theme"
          "log"
          "docker-compose"
          "csv"
          "github-dark-default"
          "rainbow-csv"
          "pylsp"
          "fleet-themes"
          "mcp-server-context7"
          "basher"
          "colored-zed-icons-theme"
          "mcp-server-github"
          "python-requirements"
          "wakatime"
          "mcp-server-sequential-thinking"
          "python-snippets"
          "autocorrect"
          "caddyfile"
          "json5"
          "tombi"
          "github-activity-summarizer"
          "mcp-server-byterover"
          "markdownlint"
          "github-actions"
          "jq"
          "jsonl"
          "desktop"
          "mcp-server-sonarqube"
          "arch-mcp"
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
        ];
      };
    };
  };
}
