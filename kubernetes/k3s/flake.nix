{
  description = "Deploy k3s cluster";

  inputs.deploy-rs.url = "github:serokell/deploy-rs";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
    deploy-rs,
  }: let
    masterNode = "k3sNode1";
    k3sNode1IP = "54.88.5.167";
    k3sNode2IP = "18.212.192.31";
    k3sNode3IP = "54.205.20.90";
  in {
    # Deploy Example node
    nixosConfigurations.example-nixos-system = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/example/configuration.nix
      ];
    };

    deploy.nodes.example = {
      sshOpts = ["-p" "22"];
      hostname = "192.168.1.58";
      fastConnection = true;
      interactiveSudo = true;
      buildOnRemote = true;
      # imports = [ ./flake.nix ];
      profiles = {
        system = {
          sshUser = "rhousand";
          path =
            deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.example-nixos-system;
          user = "root";
        };
      };
    };

    # Deploy k3sNode1
    nixosConfigurations.k3sNode1-nixos-system = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/k3sNode1/configuration.nix
        ./services/shared/default.nix
        ./services/k3s/default.nix
      ];
      specialArgs = {
        k3sArgs = {
          hostName = "k3sNode1";
          masterNode = masterNode;
          masterIP = k3sNode1IP;
          node1IP = k3sNode1IP;
          node2IP = k3sNode2IP;
          node3IP = k3sNode3IP;
        };
      };
    };

    deploy.nodes.k3sNode1 = {
      sshOpts = ["-p" "22"];
      hostname = k3sNode1IP;
      fastConnection = true;
      interactiveSudo = false;
      buildOnRemote = true;
      profiles = {
        system = {
          sshUser = "root";
          path =
            deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.k3sNode1-nixos-system;
          user = "root";
        };
      };
    };

    # Deploy k3sNode2
    nixosConfigurations.k3sNode2-nixos-system = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/k3sNode2/configuration.nix
        ./services/shared/default.nix
        ./services/k3s/default.nix
      ];
      specialArgs = {
        k3sArgs = {
          hostName = "k3sNode2";
          masterNode = masterNode;
          masterIP = k3sNode1IP;
          node1IP = k3sNode1IP;
          node2IP = k3sNode2IP;
          node3IP = k3sNode3IP;
        };
      };
    };

    deploy.nodes.k3sNode2 = {
      sshOpts = ["-p" "22"];
      hostname = k3sNode2IP;
      fastConnection = true;
      interactiveSudo = false;
      buildOnRemote = true;
      profiles = {
        system = {
          sshUser = "root";
          path =
            deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.k3sNode2-nixos-system;
          user = "root";
        };
      };
    };

    # Deploy k3sNode3
    nixosConfigurations.k3sNode3-nixos-system = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/k3sNode3/configuration.nix
        ./services/shared/default.nix
        ./services/k3s/default.nix
      ];
      specialArgs = {
        k3sArgs = {
          hostName = "k3sNode3";
          masterNode = masterNode;
          masterIP = k3sNode1IP;
          node1IP = k3sNode1IP;
          node2IP = k3sNode2IP;
          node3IP = k3sNode3IP;
        };
      };
    };

    deploy.nodes.k3sNode3 = {
      sshOpts = ["-p" "22"];
      hostname = k3sNode3IP;
      fastConnection = true;
      interactiveSudo = false;
      buildOnRemote = true;
      profiles = {
        system = {
          sshUser = "root";
          path =
            deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.k3sNode3-nixos-system;
          user = "root";
        };
      };
    };

    # Deploy-rs check by writing canary and if node is unreachable after deployment roll back
    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
  };
}
