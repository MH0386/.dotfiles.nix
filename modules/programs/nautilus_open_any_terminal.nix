{
  den.schema.conf = {

    nixos = {
      programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "ghostty";
      };
    };
  };
}
