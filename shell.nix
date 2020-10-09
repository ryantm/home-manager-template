let

  sources = import ./nix/sources.nix;

  nixpkgs = sources."nixpkgs-unstable";

  pkgs = import nixpkgs {};

in pkgs.mkShell rec {

  name = "home-manager-shell";

  buildInputs = with pkgs; [
    niv
    (import sources.home-manager {inherit pkgs;}).home-manager
    # known undeclared runtime dependencies of home-manager
    git
    nix
  ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:home-manager=${sources."home-manager"}"
    export HOME_MANAGER_CONFIG="./home.nix"
  '';

}
