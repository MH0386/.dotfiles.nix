{
  den.default = {
    nixos.programs.xonsh = {
      enable = true;
      config = "execx($(atuin init xonsh))";
    };
  };
}
