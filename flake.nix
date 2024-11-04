{
    description = "my collection of nix flake templates";
    inputs = {};

    outputs = { self, nixpkgs }: {
        templates = {
            coq = {
                path = ./Coq;
                description = "Coq template, only provides nix shell";
                welcomeText = ''
                    Check README.
                '';
            };

            cpp = {
                path = ./cpp;
                description = "C++ template, using CMake";
            };

            haskell-cabal2nix = {
                path = ./Haskell/cabal2nix;
                description = "Haskell template, using cabal";
                welcomeText = ''
                    To get full setup, see the README.md
                '';
            };
            /*
            ocaml = {
                path = ./OCaml;
                description = "";
                welcomeText = ''
                
                '';
            };
            */
            python-poetry2nix = {
                path = ./Python3/poetry2nix;
                description = "Python template, using poetry";
            };
        };
    };
}