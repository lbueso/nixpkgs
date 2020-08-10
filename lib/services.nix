{ config, pkgs, ... }: {

  services.lorri.enable = true;

  services.syncthing.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
  };

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

  services.picom = {
    enable = true;
    vSync = true;
  };

  services.password-store-sync.enable = true;
}
