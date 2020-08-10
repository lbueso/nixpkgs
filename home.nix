{ pkgs, config, ... }: {

  imports =
    [
      ./lib/overlays.nix
      ./lib/shells.nix
      ./lib/services.nix
      ./home/programs.nix
      ./home/private/mail.nix
    ];

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "emacsclient -c -nw";
    TERMINAL = "urxvtc";
    FILE_MANAGER = "ranger";
  };

  home.stateVersion = "20.03";

}
