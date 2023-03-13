{ inputs, nixpkgs, home-manager, ... }: rec {
  utilities.miscs = import ./miscs.nix { inherit nixpkgs; };
  utilities.make = import ./make.nix { inherit inputs nixpkgs home-manager utilities; };
}
