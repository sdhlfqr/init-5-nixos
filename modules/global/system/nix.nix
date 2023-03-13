{ pkgs, ... }: {
  system.stateVersion = "22.11";

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Automatic garbage collection
  nix.settings.auto-optimise-store = true;

  # Enabling git for update/rebuilds
  systemd.services.nixos-upgrade.path = [ pkgs.git ];
}
