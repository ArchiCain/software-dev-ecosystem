# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Deploy-rs";
  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/NewYork";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.zsh.enable = true;
  environment.shells = with pkgs; [zsh];

  users.groups = {
    sudoers = {};
  };

  users.users.root.openssh.authorizedKeys.keys = [
    ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDsVgHgdK6MoBZCSknLdJpQjp7prQWxs5VudYRPtyzHlJRC8jgLhl9+uTvGZmLRqJXg/OEiaF0hA3cYs81jcSR4uApxZmSGhqV+CrP7yCO8uAMKJHyOD3FF6OoY+8rEHpV/jmnN5W9UL2G5ult8ezocsTyUZ8rTYINUyC/0d/Nijo7fKumCg4fIu7aftCBrMQpe2BvYDc2mAmEXyhWTouOhQviLmkHFZVamZ8guyRRc3G0I/+q7UxyzHupNKjyD+Qt+3PwFQL3jeUqCLsS5fi5JNtaU6e/yUdKh8ekyz/3MAHmYSvjnCsB8cn3wnlsUhldoqbOkk1zwWKTtEnPzEGRaU5ShZ6ZnT5e5lBSEEXfsSHdLpogyuu7V6xoURwQi7LIC9Wbwai7Cuj0E6arlkAFdrKl8SBnnjqu8WVg7CW5pTx2bHHWd1WEZMDW/ZhRLEaxrZ5C8koSQE1Y+9ET7DKOuXKl5Eg591kg5jgtTJa6rkLSiHsR0tuToGzFhHrzn+RU= rhousand@TD-C02FG1GYMD6Ns-MacBook-Pro.local''
  ];
  users.users.rhousand = {
    shell = pkgs.zsh;
    isNormalUser = true;
    packages = with pkgs; [
      vim-full
      ripgrep
      git
    ];
    extraGroups = [
      "wheel"
      "sudoers"
    ];
    openssh.authorizedKeys.keys = [
      ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDsVgHgdK6MoBZCSknLdJpQjp7prQWxs5VudYRPtyzHlJRC8jgLhl9+uTvGZmLRqJXg/OEiaF0hA3cYs81jcSR4uApxZmSGhqV+CrP7yCO8uAMKJHyOD3FF6OoY+8rEHpV/jmnN5W9UL2G5ult8ezocsTyUZ8rTYINUyC/0d/Nijo7fKumCg4fIu7aftCBrMQpe2BvYDc2mAmEXyhWTouOhQviLmkHFZVamZ8guyRRc3G0I/+q7UxyzHupNKjyD+Qt+3PwFQL3jeUqCLsS5fi5JNtaU6e/yUdKh8ekyz/3MAHmYSvjnCsB8cn3wnlsUhldoqbOkk1zwWKTtEnPzEGRaU5ShZ6ZnT5e5lBSEEXfsSHdLpogyuu7V6xoURwQi7LIC9Wbwai7Cuj0E6arlkAFdrKl8SBnnjqu8WVg7CW5pTx2bHHWd1WEZMDW/ZhRLEaxrZ5C8koSQE1Y+9ET7DKOuXKl5Eg591kg5jgtTJa6rkLSiHsR0tuToGzFhHrzn+RU= rhousand@TD-C02FG1GYMD6Ns-MacBook-Pro.local''
    ];
  };
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #users.users.rhousand = {
  #  isNormalUser = true;
  #  extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #  packages = with pkgs; [
  #    vim-full
  #    ripgrep
  #    git
  #  ];
  #};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim-full # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [22 80];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}