{ pkgs, config, ... }: {

  imports =
    [
      ./lib/shells.nix
      ./lib/services.nix
      ./lib/cli-tools.nix
      ./lib/programs.nix
      ./lib/overlays.nix
      ./private/mail.nix
    ];

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "emacsclient -c -nw";
    TERMINAL = "urxvtc";
  };

  home.stateVersion = "20.03";

}
