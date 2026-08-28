{ pkgs, lib, ... }:
{
  files = {
    ".github/actionlint.yaml".yaml = {
      paths = {
        ".github/workflows/**/*.lock.yml".ignore = [ ".*" ];
        ".github/workflows/agentics-maintenance.yml".ignore = [ ".*" ];
      };
    };
    ".markdownlint.yaml".yaml = {
      MD013 = false;
    };
    ".markdownlintignore".text = ''
      .github/
    '';
    ".yamllint.yaml".yaml = {
      extends = "default";
      rules = {
        document-start = "disable";
        truthy = "disable";
        comments = "disable";
        line-length.max = 120;
      };
      ignore = [ ".github/workflows/" ];
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

  git-hooks = {
    package = pkgs.pre-commit;
    hooks =
      let
        enabledHooks = [
          "actionlint"
          "nixfmt"
          "check-added-large-files"
          "check-case-conflicts"
          "check-json"
          "check-merge-conflicts"
          "check-toml"
          "check-vcs-permalinks"
          "check-symlinks"
          "check-xml"
          "check-yaml"
          "deadnix"
          "detect-private-keys"
          "markdownlint"
          "mixed-line-endings"
          "yamlfmt"
          "ripsecrets"
          "statix"
          "taplo"
          "trufflehog"
          "yamllint"
          "nixf-diagnose"
        ];
      in
      lib.genAttrs enabledHooks (_: { enable = true; });
  };

  treefmt = {
    enable = true;
    config = {
      programs = lib.genAttrs [
        "actionlint"
        "jsonfmt"
        "nixf-diagnose"
        "nixfmt"
        "deadnix"
        "oxipng"
        "statix"
        "taplo"
        "xmllint"
        "yamlfmt"
      ] (_: { enable = true; });
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
