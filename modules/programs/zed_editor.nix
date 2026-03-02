{ delib, ... }:
delib.module {
  name = "zed-editor";

  options.zed-editor = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.zed-editor =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      userSettings = {
        agent_servers = {
          kimi = {
            type = "registry";
          };
          opencode = {
            type = "registry";
          };
          github-copilot = {
            type = "registry";
          };
          junie-acp = {
            type = "registry";
          };
        };
        ui_font_size = 18.0;
        buffer_font_size = 20.0;
        languages = {
          Nix = {
            formatter = {
              external = {
                command = "nixfmt";
              };
            };
          };
          Python = {
            language_servers = [
              "ty"
              "!basedpyright"
              "..."
            ];
          };
        };
        calls = {
          mute_on_join = true;
        };
        git = {
          inline_blame = {
            show_commit_summary = false;
          };
        };
        terminal = {
          copy_on_select = true;
        };
        git_panel = {
          tree_view = true;
          sort_by_path = true;
        };
        project_panel = {
          hide_hidden = false;
          hide_root = true;
          hide_gitignore = false;
        };
        preview_tabs = {
          enable_preview_from_file_finder = true;
        };
        tabs = {
          show_diagnostics = "errors";
          file_icons = true;
          git_status = true;
        };
        title_bar = {
          show_menus = false;
          show_branch_icon = true;
        };
        prettier = {
          allowed = true;
        };
        colorize_brackets = true;
        inlay_hints = {
          enabled = true;
        };
        always_treat_brackets_as_autoclosed = true;
        toolbar = {
          code_actions = true;
        };
        autosave = {
          after_delay = {
            milliseconds = 1000;
          };
        };
        restore_on_startup = "last_session";
        theme = "GitHub Dark";
        context_servers = {
          arch-ops-server = {
            enabled = false;
            settings = { };
          };
        };
        agent = {
          play_sound_when_agent_done = true;
          default_model = {
            provider = "copilot_chat";
            model = "gpt-5-mini";
          };
          model_parameters = [ ];
        };
      };
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
}
