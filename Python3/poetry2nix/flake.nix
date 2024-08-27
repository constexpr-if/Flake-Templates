{
  description = "Template Flake for Python Projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    poetry2nix.url = "github:nix-community/poetry2nix";
  };

  outputs = { self, nixpkgs, poetry2nix }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      p2n = poetry2nix.lib.mkPoetry2Nix { pkgs = pkgs; };
      poetryEnv = p2n.mkPoetryEnv { projectDir = self; };
    in
    {
      packages.${system}.default = p2n.mkPoetryApplication {
        projectDir = self;
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          poetryEnv
          poetry
        ];
      };
    };
}
