{ ... }: {
  networking.firewall.enable = true;

  # Blocking all ports
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
