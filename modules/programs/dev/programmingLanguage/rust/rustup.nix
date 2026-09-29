{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        # Prefer a Nix-managed Rust toolchain here. The nixpkgs `rustup` wrapper
        # bakes store paths into linker helpers, and those wrappers can break
        # after system/profile upgrades when old store paths are GC'd.
        home.packages = [
          pkgs.cargo
          pkgs.clippy
          pkgs.rust-analyzer
          pkgs.rustc
          pkgs.rustfmt
          pkgs.rustlings
        ];
      };
  };
}
