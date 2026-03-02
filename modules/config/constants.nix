{ delib, ... }:
delib.module {
  name = "constants";

  options.constants = with delib; {
    username = readOnly (strOption "mohamed");
    userfullname = readOnly (strOption "Mohamed Hisham Abdelzaher");
    useremail = readOnly (strOption "mohamed.hisham.abdelzaher@gmail.com");
  };
}
