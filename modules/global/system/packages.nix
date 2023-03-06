{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    p7zip
    unzip
    wget
    git
    htop
    tree
    fzf
    direnv
    gnumake
  ];
}