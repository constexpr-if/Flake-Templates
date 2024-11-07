{
  description = "Template Flake for OCaml Projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_2;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; with ocamlPackages; [
          dune_3
          ocaml
          opam
        ];
      };
    };
}