{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) ocamlPackages;
    in
    {
      packages.${system}.default = ocamlPackages.buildDunePackage {
        pname = "OCamlPS";
        version = "0.1.0";
        src = ./.;
        nativeBuildInputs = with ocamlPackages; [
          ocaml-lsp
          ocamlformat
        ];
      };
    };
}
