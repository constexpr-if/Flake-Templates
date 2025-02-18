{
  description = "C++ Template Flake which is capable of multiple packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) stdenv;
    in
    {
      packages.${system}.hello = stdenv.mkDerivation {
        pname = "hello";
        version = "0.1.0";
        src = ./.;
        nativeBuildInputs = with pkgs; [
          cmake-language-server
          cmakeMinimal
          libgcc
        ];
        installPhase = ''
          mkdir -p $out/lib $out/bin
          cp -r . $out/lib
          ln $out/lib/hello $out/bin
        '';
      };
    };
}
