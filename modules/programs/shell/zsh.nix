{
  den.default = {
    nixos.programs.zsh.enable = true;
    homeManager =
      { lib, config, ... }:
      {
        programs.zsh = {
          enable = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
          zsh-abbr.enable = true;
          zplug = {
            enable = true;
            plugins = [
              { name = "zsh-users/zsh-autosuggestions"; }
              { name = "andreacasarin/zsh-ask-opencode"; }
            ]
            ++ (map
              (name: {
                name = "plugins/${name}";
                tags = [ "from:oh-my-zsh" ];
              })
              [
                "git"
                "docker"
                "docker-compose"
                "python"
                "pip"
                "node"
                "npm"
                "yarn"
                "rust"
                "sudo"
                "extract"
                "command-not-found"
              ]
            );
          };
          initContent = lib.mkOrder 1500 ''
            ${lib.getExe config.programs.fastfetch.package}

            if [ -f ${config.home.homeDirectory}/.secrets.env ]; then
              source ${config.home.homeDirectory}/.secrets.env
            fi
          '';
        };
      };
  };
}
