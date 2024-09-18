{
  pkgs,
  modulesPath,
  k3sArgs,
  ...
}: {
  imports = ["${modulesPath}/virtualisation/amazon-image.nix"];

  # By nix purests flakes are experimental however they have been stable for years. To make nix commands shorter we tell nix to allow flakes below:
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "${k3sArgs.hostName}";

  # Install vim from nixpkgs an tailscale from nixpkgs-unstable.
  system.stateVersion = "24.05";
}
