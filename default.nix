{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  jetbrains-mono-nerdfonts =
    pkgs.callPackage ./pkgs/jetbrains-mono-nerdfonts { };
}