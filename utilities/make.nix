{ inputs, nixpkgs, home-manager, utilities, ... }: rec {
  nixosSystem = profile_name: profile_info: nixpkgs.lib.nixosSystem {
    system = profile_info.platform;
    specialArgs = { inherit profile_name profile_info inputs nixpkgs home-manager utilities; };
    modules = [
      ../profiles/${profile_name}
      home-manager.nixosModules.home-manager
      (homeConfiguration profile_name profile_info)
    ];
  };

  homeConfiguration = profile_name: profile_info: {
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      extraSpecialArgs = { inherit utilities; };
      users = builtins.mapAttrs (name: _: import (../profiles + "/${profile_name}/users/${name}/home/${profile_name}" + ".nix")) (builtins.readDir ../profiles "/${profile_name}/users");
    };
  };
}
