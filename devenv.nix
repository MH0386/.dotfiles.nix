{ pkgs, lib, ... }:
{
  files = {
    ".yamllint.yaml".yaml = {
      extends = "default";
      rules = {
        document-start = "disable";
        truthy = "disable";
        comments = "disable";
        line-length.max = 120;
      };
    };
    ".yamlfmt.yaml".yaml = {
      formatter = {
        type = "basic";
        line_ending = "lf";
        max_line_length = 140;
        trim_trailing_whitespace = true;
        eof_newline = true;
        force_array_style = "block";
      };
    };
    "statix.toml".toml = {
      ignore = [
        ".direnv"
        "**/hardware-configuration.nix"
      ];
    };
  };

  languages = {
    nix = {
      enable = true;
      lsp.enable = true;
    };
  };

  opencode = {
    enable = true;
    settings = {
      mcp = {
        github = {
          type = "remote";
          url = "https://api.githubcopilot.com/mcp";
          headers = {
            Authorization = "{env:GITHUB_PERSONAL_ACCESS_TOKEN}";
          };
        };
        nixos = {
          type = "local";
          command = [ "${lib.getExe pkgs.mcp-nixos}" ];
        };
        devenv = {
          type = "local";
          command = [
            "devenv"
            "mcp"
          ];
        };
        context7 = {
          type = "remote";
          url = "https://mcp.context7.com/mcp";
        };
      };
      plugin = [
        "opencode-wakatime"
        "@mohak34/opencode-notifier"
        "oh-my-openagent"
        "@franlol/opencode-md-table-formatter"
        "@plannotator/opencode"
        "@tarquinen/opencode-dcp"
        "opencode-websearch-cited"
        "opencode-pty"
      ];
    };
    commands = {
      agents-md-maintenance = ''
        # Agents Maintenance Agent

        You are the Agents Maintenance Agent. Your goal is to keep the `AGENTS.md` file accurate and current by reviewing recent changes
        in the repository.

        ## Mission

        Every day, you will review merged pull requests and updated source files from the last 7 days. You will analyze these changes to
        determine if `AGENTS.md` needs to be updated to reflect new patterns, commands or guidelines. If updates are required, you will
        open a pull request.

        ## Current Context

        - **Target File**: `AGENTS.md`

        ## Workflow

        ### 1. Fetch Git History

        Retrieve the history for the last week to identify what has changed.

        # Fetch history
        !'git fetch --unshallow || echo "Repository already has full history"'

        # Identify changed files in the last 7 days
        !'git log --since="7 days ago" --name-only --pretty=format: | sort | uniq > /tmp/changed_files.txt'

        # Get a summary of merged PRs and commits
        !'git log --since="7 days ago" --pretty=format:"%h - %an : %s" > /tmp/recent_commits.txt'

        ### 2. Analyze Changes

        Review the `/tmp/changed_files.txt` and `/tmp/recent_commits.txt` to identify modifications in:

        - **Build/Test Configuration**: `pyproject.toml`, `uv.lock`, `Dockerfile`
        - **Linting/Formatting**: `.pre-commit-config.yaml`, `ruff.toml`
        - **Source Code**: `src/`, `tests/` (look for new patterns or style changes)
        - **Documentation**: `README.md` or other docs that might contradict `AGENTS.md`

        ### 3. Verify AGENTS.md Accuracy

        Read the current `AGENTS.md`:

        !'cat AGENTS.md'

        Compare the current guidelines against the recent changes. Ask yourself:

        - Have the build/install commands changed? (e.g., `uv sync` vs `pip install`)
        - Are there new linters or formatting rules?
        - Has the project structure changed?
        - Are there new testing requirements?

        ### 4. Update and Create PR

        **If updates are needed:**

        1. Modify `AGENTS.md` to reflect the new reality.
        2. Call the `create-pull-request` tool to submit the changes.
            - **Title**: Update AGENTS.md
            - **Body**: Description of what was updated and why.
            - **Branch**: `agents-md-maintenance/update-agents-md`

        **If no updates are needed:**

        1. Call the `noop` tool.

        ## Output Requirements

        - **Success**: Call `create-pull-request` with the updated file content OR call `noop` if the file is already up to date.
        - **Failure**: If you cannot complete the task, exit with an error.

        Begin the maintenance review now.
      '';
    };
  };

  git-hooks = {
    package = pkgs.pre-commit;
    hooks = {
      action-validator.enable = true;
      actionlint.enable = true;
      nixfmt.enable = true;
      check-added-large-files.enable = true;
      check-case-conflicts.enable = true;
      check-json.enable = true;
      check-merge-conflicts.enable = true;
      check-toml.enable = true;
      check-vcs-permalinks.enable = true;
      check-symlinks.enable = true;
      check-xml.enable = true;
      check-yaml.enable = true;
      comrak.enable = true;
      deadnix.enable = true;
      detect-private-keys.enable = true;
      markdownlint.enable = true;
      mixed-line-endings.enable = true;
      yamlfmt.enable = true;
      ripsecrets.enable = true;
      statix.enable = true;
      taplo.enable = true;
      trim-trailing-whitespace.enable = true;
      trufflehog.enable = true;
      yamllint.enable = true;
      nixf-diagnose.enable = true;
    };
  };

  treefmt = {
    enable = true;
    config = {
      programs = {
        actionlint.enable = true;
        jsonfmt.enable = true;
        nixf-diagnose.enable = true;
        nixfmt.enable = true;
        deadnix.enable = true;
        oxipng.enable = true;
        statix.enable = true;
        taplo.enable = true;
        xmllint.enable = true;
        yamlfmt.enable = true;
      };
      settings = {
        formatter = {
          taplo-format = {
            command = "${lib.getExe pkgs.taplo}";
            options = [ "format" ];
            includes = [ "*.toml" ];
            excludes = [
              ".git/*"
              ".devenv/*"
            ];
          };
        };
      };
    };
  };
}
