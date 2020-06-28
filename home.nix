{ pkgs, ... }:

{

  # Configuration options are documented at
  #   https://rycee.gitlab.io/home-manager/options.html

  # Since we do not install home-manager, you need to let home-manager
  # manage your shell, otherwise it will not be able to add its hooks
  # to your profile.
  programs.bash = {
    enable = true;
  };

  home.packages = [
    pkgs.htop
    pkgs.fortune
  ];

}
