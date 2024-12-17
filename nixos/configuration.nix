{ pkgs, lib, ... }:
let
  # myHostname = lib.trim pkgs.lib.readFile "${pkgs.runCommand "hostname" { } "echo -n `hostname` > $out"}";
  hostname = pkgs.runCommand "hostname" { } "echo -n `hostname` > $out";
  myHostname = lib.trim (lib.readFile hostname);
in
{
  imports = [
    ./hardware-configuration.nix
    ./configuration/boot.nix
    ./configuration/hardware.nix
    ./configuration/locale.nix
    ./configuration/programs.nix
    ./configuration/services.nix
    ./configuration/users.nix
    ./configuration/environment.nix
    ./configuration/home-manager.nix
    ./configuration/networking.nix
    ./configuration/security.nix
    ./configuration/system.nix
    ./configuration/virtualisation.nix
    ./device/${myHostname}/configuration.nix
  ];
}
