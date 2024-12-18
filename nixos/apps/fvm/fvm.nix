{ pkgs, builtins, ... }:
let
  version =
    (builtins.fromJSON (
      builtins.readFile (
        builtins.fetchurl {
          url = "https://api.github.com/repos/leoafarias/fvm/releases/latest";
          sha256 = "0rr7w19v3pf6a7a9dya2kl5ac1s0n3jp694mvbg9xgnw58jmz3pa";
        }
      )
    )).tag_name;
in
pkgs.stdenv.mkDerivation {
  pname = "fvm";
  version = version;
  src = builtins.fetchTarball {
    url = "https://github.com/leoafarias/fvm/releases/download/${version}/fvm-${version}-linux-x64.tar.gz";
    sha256 = "1g4dp42ihg9svqwjxj5lijx33d8vhyczpyn03dgrxi0iwqlc391b";
  };
  installPhase = "mkdir -p $out/bin; cp -r * $out/bin/";
}
