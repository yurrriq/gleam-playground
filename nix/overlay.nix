self: super: {
  gleam = super.callPackage ./pkgs/gleam {
    inherit (super.darwin.apple_sdk.frameworks) Security;
  };

  inherit (import (import ./sources.nix).niv { pkgs = super; }) niv;
}
