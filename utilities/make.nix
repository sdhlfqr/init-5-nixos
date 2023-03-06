{ inputs, nixpkgs, home-manager, ... }: rec {
  nixosSystem = profile_name: profile_info: nixpkgs.lib.nixosSystem {
    system = profile_info.platform;
    specialArgs = { inherit profile_name profile_info inputs nixpkgs home-manager; };
    modules = [
      ../profiles/${profile_name}
    ];
  };
}
