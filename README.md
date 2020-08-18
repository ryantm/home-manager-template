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

You must have [nix](https://nixos.org) version 2.4 or greater
installed on your machine, with the experimental flakes feature turned
on.

See [this post](https://www.tweag.io/blog/2020-05-25-flakes/) for
details about how to try out flakes.

# Tutorial

1. Click the "Use this template" button on GitHub
2. Clone your repository onto the computer you want to configure
3. Edit `./home.nix` to be how you want it.
4. Run the switch script to switch to your configuration:

    ```sh
    ./switch.sh
    ```

    which is shorthand for:

    ```
    nix develop -c "home-manager switch"
    ```



# Caveats

Since we do not install home-manager, you need to let home-manager
manage your shell, otherwise it will not be able to add its hooks to
your profile.

Also since we do not install home-manager, you cannot run the
home-manager script from any directory and expect it to work. It must
be run from within the nix-shell. (This is actually a feature!)
