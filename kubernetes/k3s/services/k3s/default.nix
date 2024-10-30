{
  config,
  lib,
  pkgs,
  k3sArgs,
  ...
}: {
  # Fixes for longhorn
  # See https://www.freedesktop.org/software/systemd/man/latest/tmpfiles.d.html For information regarding tempfile.d
  systemd.tmpfiles.rules = [
    "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
  ];
  virtualisation.docker.logDriver = "json-file";

  # Add entry for nodes to systems hostfile
  networking.hosts = {
    "${k3sArgs.node1IP}" = ["k3sNode1"];
    "${k3sArgs.node2IP}" = ["k3sNode2"];
    "${k3sArgs.node3IP}" = ["k3sNode3"];
  };
  # Configure K3s Nodes
  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = "/var/lib/rancher/k3s/server/token";
    # On frist deployment create token using nix run nixpkgs#pwgen -s 16 and add it below. Also commet our tokenFile above. Do not commit the cluster token to git
    # The followins can be used to generate a token "nix run nixpkgs#pwgen -- -s -n 16 |head -n 2"
    #token = "";
    extraFlags = toString ([
        "--write-kubeconfig-mode \"0644\""
        "--cluster-init"
        "--tls-san ${k3sArgs.node1IP}"
        #"--disable servicelb"
        #"--disable traefik"
        "--disable local-storage"
      ]
      ++ (
        if k3sArgs.hostName == "${k3sArgs.masterNode}"
        then []
        else [
          "--server https://${k3sArgs.masterNode}:6443"
        ]
      ));
    clusterInit = k3sArgs.hostName == "${k3sArgs.masterNode}";
  };
  services.openiscsi = {
    enable = true;
    name = "iqn.2016-04.com.open-iscsi:${k3sArgs.hostName}";
  };
}
