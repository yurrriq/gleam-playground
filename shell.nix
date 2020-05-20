{ pkgs ? import ./nix }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    erlang
    gleam
    niv
    nixpkgs-fmt
    rebar3
  ];
}
