{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # screenshots
    maim
    xclip
    xdotool
    # desktop environment
    xmobar
    rofi
    rofi-pass
    dejavu_fonts
  ];

  home.file = {
    ".xmonad" = {
      source = ./xmonad;
      recursive = true;
    };

    ".xmobarrc".source = ./config/xmobar;

  };

}
