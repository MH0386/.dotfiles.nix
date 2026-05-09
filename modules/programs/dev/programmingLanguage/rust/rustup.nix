{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          # Prefer a Nix-managed Rust toolchain here. The nixpkgs `rustup`
          # wrapper bakes store paths into linker helpers, and those wrappers
          # can break after system/profile upgrades when old store paths are GC'd.
          cargo
          clippy
          rust-analyzer
          rustc
          rustfmt
          rustlings
        ];
      };
  };
}
