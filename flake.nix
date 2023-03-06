{
  description = "init-5: NixOS Configuration and Home-Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      utilities = (import ./utilities { inherit inputs nixpkgs home-manager; }).utilities;
      profiles = builtins.mapAttrs (name: _: import ./profiles/${name}/info.nix) (builtins.readDir ./profiles);
    in
    {
      devShells = utilities.miscs.devShells;
      formatter = utilities.miscs.formatter;

      nixosConfigurations = builtins.mapAttrs
        (name: info: utilities.make.nixosSystem name info)
        (profiles);
    };
}
