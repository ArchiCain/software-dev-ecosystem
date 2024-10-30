{
  config,
  lib,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.zsh.enable = true;
  environment.shells = with pkgs; [zsh];

  environment.systemPackages = with pkgs; [
    vim-full
    tailscale
    cifs-utils
    nfs-utils
    git
  ];

  # Ensure Tailscale is Enabled
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "none";
  };


  # Select internationalisation properties.
  #  i18n.defaultLocale = "en_US.UTF-8";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LANGUAGE = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
    };

};

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

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
      ripgrep
    ];
    extraGroups = [
      "wheel"
      "sudoers"
    ];
    openssh.authorizedKeys.keys = [
      ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDsVgHgdK6MoBZCSknLdJpQjp7prQWxs5VudYRPtyzHlJRC8jgLhl9+uTvGZmLRqJXg/OEiaF0hA3cYs81jcSR4uApxZmSGhqV+CrP7yCO8uAMKJHyOD3FF6OoY+8rEHpV/jmnN5W9UL2G5ult8ezocsTyUZ8rTYINUyC/0d/Nijo7fKumCg4fIu7aftCBrMQpe2BvYDc2mAmEXyhWTouOhQviLmkHFZVamZ8guyRRc3G0I/+q7UxyzHupNKjyD+Qt+3PwFQL3jeUqCLsS5fi5JNtaU6e/yUdKh8ekyz/3MAHmYSvjnCsB8cn3wnlsUhldoqbOkk1zwWKTtEnPzEGRaU5ShZ6ZnT5e5lBSEEXfsSHdLpogyuu7V6xoURwQi7LIC9Wbwai7Cuj0E6arlkAFdrKl8SBnnjqu8WVg7CW5pTx2bHHWd1WEZMDW/ZhRLEaxrZ5C8koSQE1Y+9ET7DKOuXKl5Eg591kg5jgtTJa6rkLSiHsR0tuToGzFhHrzn+RU= rhousand@TD-C02FG1GYMD6Ns-MacBook-Pro.local''
    ];
  };

  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "prohibit-password";
  };
  networking.firewall.enable = false;
}
