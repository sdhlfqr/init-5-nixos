{ ... }: {
  home.stateVersion = "22.11";

  # Enabling home-manager for it to control itself
  programs.home-manager.enable = true;

  # Refresh the systemd services when home-manager is switching
  systemd.user.startServices = "sd-switch";
}