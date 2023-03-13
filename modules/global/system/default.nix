{ ... }: {
  imports = [
    ./docker.nix
    ./home.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./users.nix
  ];
}
