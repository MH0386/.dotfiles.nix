{
  den.default = {
    nixos = {
      programs.nh = {
        enable = true;
        flake = "/home/mohamed/.dotfiles";
        clean = {
          enable = true;
          extraArgs = "--keep 5";
        };
      };
    };
  };
}
