{ pkgs, lib, inputs, ... }:
let
  pkgs-unstable = import inputs.nixpkgs-unstable { system = pkgs.stdenv.system; };
in
{
  languages.typst = {
    enable = true;
    package = pkgs-unstable.typst;
  };

  env.TYPST_FONT_PATHS = lib.concatStringsSep ":" [
    "${pkgs-unstable.nerd-fonts.liberation}/share/fonts/truetype"
  ];

  scripts = {
    build.exec = "typst compile --root . --ignore-system-fonts resume/$1.typ output/$1.pdf";
    watch.exec = "typst watch --root . --ignore-system-fonts resume/$1.typ output/$1.pdf";
  };
}
