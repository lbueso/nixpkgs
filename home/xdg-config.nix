{ pkgs, config, ...}: {

  xdg.configFile = {
    "ranger/rc.conf".source = ./config/ranger.conf;
    "rofi-pass/config".source = ./config/rofi-pass.conf;
    "qutebrowser/config.py".source = ./config/qutebrowser.py;
  };

}
