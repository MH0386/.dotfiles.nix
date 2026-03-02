{ delib, ... }:
delib.module {
  name = "bash";

  home.always.programs.bash.enable = true;
}
