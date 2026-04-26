{
  den.default = {
    homeManager =
      { lib, config, ... }:
      {
        home.sessionVariables = {
          EDITOR = "${lib.getExe config.programs.zed-editor.package} --wait";
          VISUAL = "${lib.getExe config.programs.zed-editor.package} --wait";
        };
        programs.zed-editor = {
          enable = true;
          userSettings = {
            diagnostics.inline.enabled = true;
            agent = {
              default_model = {
                enable_thinking = true;
                model = "gemini-3.1-pro-preview";
                provider = "google";
              };
              favorite_models = [
                {
                  enable_thinking = false;
                  model = "big-pickle";
                  provider = "opencode";
                }
                {
                  enable_thinking = false;
                  model = "nemotron-3-super-free";
                  provider = "opencode";
                }
              ];
              model_parameters = [ ];
              play_sound_when_agent_done = "always";
              tool_permissions.tools = {
                "mcp:mcp-nixos:nix".default = "allow";
                terminal.always_allow = [ { pattern = "^cargo\\s"; } ];
              };
            };
            agent_servers = {
              claude-acp.type = "registry";
              codex-acp.type = "registry";
              gemini.type = "registry";
              github-copilot-cli.type = "registry";
              junie.type = "registry";
              kilo = {
                favorite_models = [
                  "kilo/kilo/auto-free"
                ];
                type = "registry";
              };
              kimi.type = "registry";
              opencode.type = "registry";
              pi-acp.type = "registry";
            };
            always_treat_brackets_as_autoclosed = true;
            autosave.after_delay.milliseconds = 1000;
            base_keymap = "JetBrains";
            buffer_font_size = 20;
            calls.mute_on_join = true;
            colorize_brackets = true;
            context_servers = {
              arch-ops-server = {
                enabled = false;
                settings = { };
              };
              mcp-nixos = {
                args = [ ];
                command = "mcp-nixos";
                enabled = true;
                env = { };
                remote = false;
              };
              mcp-server-github = {
                enabled = true;
                remote = false;
                settings = { };
              };
            };
            edit_predictions.provider = "zed";
            git.inline_blame.show_commit_summary = false;
            git_panel = {
              sort_by_path = true;
              tree_view = true;
            };
            inlay_hints.enabled = true;
            languages = {
              Rust = {
                inlay_hints.show_background = true;
                indent_guides = {
                  coloring = "indent_aware";
                  background_coloring = "indent_aware";
                };
              };
              Nix.formatter.external.command = "nixfmt";
              Python.language_servers = [
                "ty"
                "!basedpyright"
                "..."
              ];
            };
            lsp = {
              rust-analyzer = {
                enable_lsp_tasks = true;
                initialization_options = {
                  rust.analyzerTargetDir = true;
                  inlayHints = {
                    lifetimeElisionHints = {
                      enable = "skip_trivial";
                      useParameterNames = true;
                    };
                    closureReturnTypeHints.enable = "always";
                  };
                };
              };
              nil.settings.nix.flake.autoArchive = true;
            };
            prettier.allowed = true;
            preview_tabs.enable_preview_from_file_finder = true;
            project_panel = {
              hide_gitignore = false;
              hide_hidden = false;
              hide_root = true;
            };
            restore_on_startup = "last_session";
            tabs = {
              file_icons = true;
              git_status = true;
              show_diagnostics = "errors";
            };
            terminal.copy_on_select = true;
            theme = "Warp One Dark";
            title_bar = {
              show_branch_icon = true;
              show_menus = false;
            };
            toolbar.code_actions = true;
            ui_font_size = 18;
          };
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
