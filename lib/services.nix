{ config, pkgs, ... }: {

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
  };

  # TODO emacs, emacs-telega, emacs-mail
  services.spotifyd = {         # working but the service does not start correctly
    enable = true;
    settings = {
      global = {
        username = "1164908957";
        password_cmd = "pass programs/spotifyd";
        backend = "alsa";
        control = "alsa_audio_device";
        bitrate = "320";
        device_type = "computer";
      };
    };
  };

  services.emacs.enable = true;

  services.syncthing.enable = true;

  services.picom = {
    enable = true;
    vSync = true;
  };

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

  services.password-store-sync.enable = true;
}
