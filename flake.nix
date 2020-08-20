{
  description = "A flake for home-manager-template";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.home-manager = {
    type = "github";
    owner = "rycee";
    repo = "home-manager";
    flake = false;
  };

  outputs = { self, flake-utils, nixpkgs, home-manager }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        devShell = pkgs.mkShell rec {

          name = "home-manager-template-shell";

          buildInputs = with pkgs; [
            (import home-manager {inherit pkgs;}).home-manager
          ];

          shellHook = ''
            export NIX_PATH="nixpkgs=${nixpkgs}:home-manager=${home-manager}"
            export HOME_MANAGER_CONFIG="./home.nix"
            PS1="${name}> "
          '';
        };
      });
}
