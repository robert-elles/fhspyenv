{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fhs = pkgs.buildFHSUserEnv {
        name = "fhs-shell";
        # targetPkgs = pkgs: [ pkgs.gcc pkgs.libtool ];
        runScript = ''
          poetry install
        '';
      };
    in
    {
      devShells.${system}.default = fhs.env;
    };
}
