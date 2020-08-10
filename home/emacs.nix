{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # latex
    python37Packages.pygments
    texlive.combined.scheme-full
    aspell
    aspellDicts.es
    aspellDicts.en
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacsUnstable;
    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };

  home.file = {
    ".emacs.d" = {
      source = ./emacs;
      recursive = true;
    };
  };

  services.emacs.enable = true;

  systemd.user.services.emacs-mail = {
    Unit = {
      Description = "Emacs text editor as a mailclient";
    };
    Service = {
      ExecStart = "${pkgs.emacs}/bin/emacs --daemon=mail";
      ExecStop = "${pkgs.emacs}/bin/emacsclient -server-file=mail --eval '(kill-emacs)'";
      Restart = [ "on-failure" ];
    };
  };

}
