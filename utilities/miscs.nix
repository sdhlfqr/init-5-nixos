{ nixpkgs, ... }: rec {
  forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
  forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

  devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });
  formatter = forEachPkgs (pkgs: pkgs.nixpkgs-fmt);
}
