# home-manager template

This provides a quick-start template for using
[home-manager](https://github.com/rycee/home-manager) in a more
reproducible way. You don't have to install home-manager, and it uses
pinning.

# Why?

home-manager is a great way to manage user-specific configuration
("dotfiles") in a reproducible way. This template takes
reproducibility another step by making it so you do not need to
install home-manager to use it, and do not need to install
home-manager configuration files in a specific place.

Also, since this uses niv to pin nixpkgs and home-manager, you do not
need nixpkgs on your path and can be sure the build will be the same
on any computer.

# Prerequisites

You must have [nix](https://nixos.org) installed on your machine.

```sh
curl -L https://nixos.org/nix/install | sh
```

# Tutorial

1. Click the "Use this template" button on GitHub
2. Clone your repository onto the computer you want to configure
3. Update dependencies (home-manager and nixpkgs) to the latest version:

   ```sh
   ./update-dependencies.sh
   ```

   which is just shorthand for:

   ```
   nix-shell --run "niv update"
   ```

4. Edit `./home.nix` to be how you want it.
5. Run the switch script to switch to your configuration:

    ```sh
    ./switch.sh
    ```

    which is just shorthand for:

    ```
    nix-shell --run "home-manager switch"
    ```



# Caveats

Since we do not install home-manager, you need to let home-manager
manage your shell, otherwise it will not be able to add its hooks to
your profile, e.g. no shell variables will get set by home-manager.
Please consult home-manager documentation for exact required steps.

Also since we do not install home-manager, you cannot run the
home-manager script from any directory and expect it to work. It must
be run from within the nix-shell. (This is actually a feature!)
