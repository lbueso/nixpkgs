{ config, pkgs, ... }: {

  imports =
    [
      ./emacs.nix
      ./urxvt.nix
      ./xdg-config.nix
      ./xmonad.nix
      ./zathura.nix
    ];

  home.packages = with pkgs; [
    htop
    unzip
    killall
    tree
    cava
    pulsemixer
    w3m
    mu
    tldr
    gnupg

    direnv
    # multimedia
    feh
    mpv
    spotify-tui
    # utilities
    ranger
    qutebrowser
    # cmake
    # gnumake
    syncthing-gtk
    # social media
    tdesktop
  ];

  programs.git = {
    enable = true;
    userName  = "Luis Eduardo Bueso de Barrio";
    userEmail = "luiseduardobueso96@gmail.com";
    package = pkgs.gitAndTools.gitSVN;
  };

  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "/home/luis/.password-store"; # TODO use env
    };
  };

}
