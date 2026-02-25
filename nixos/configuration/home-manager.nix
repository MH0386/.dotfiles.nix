{
  pkgs,
  nur,
  pkgsStable,
  nix-jetbrains-plugins,
  ...
}:
let
  timestamp = pkgs.lib.readFile "${pkgs.runCommand "timestamp" { }
    "echo -n `date '+%Y%m%d%H%M%S'` > $out"
  }";
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mohamed = import ./../home-manager/hm-configuration.nix;
    extraSpecialArgs = {
      inherit nur;
      inherit pkgsStable;
      inherit nix-jetbrains-plugins;
    };
    backupFileExtension = "backup-${timestamp}";
    verbose = true;
  };
}
