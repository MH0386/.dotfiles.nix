{ pkgs,lib, ... }:
let
  timestamp = pkgs.lib.readFile "${pkgs.runCommand "timestamp" { } "echo -n `date '+%Y%m%d%H%M%S'` > $out" }";
  fvm = import ./../apps/fvm/fvm.nix { inherit pkgs lib builtins; };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mohamed = import ./home-manager/home.nix;
    extraSpecialArgs = { };
    backupFileExtension = "backup-${timestamp}";
  };
}
