{ pkgs, ... }: {
  system.stateVersion = "22.11";

  # Automatic garbage collection
  nix.settings.auto-optimise-store = true;

  # Enabling git for update/rebuilds
  systemd.services.nixos-upgrade.path = [ pkgs.git ];
}
