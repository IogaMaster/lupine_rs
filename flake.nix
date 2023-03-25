{
  description = "A basic web browser written in Rust";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = with pkgs; mkShell {
        # Tools
        nativeBuildInputs = [
          rustup
          rust-analyzer

          pkg-config
        ];

        # Libraries
        buildInputs = [
          # Wry Deps
          gtk4
          webkitgtk_4_1
        ];
      };
    };
}
