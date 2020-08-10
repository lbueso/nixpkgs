{ pkgs, config, ... }: {

  programs.urxvt = {
    enable = true;
    fonts = [ "xft:Deja Vu Sans Mono:size=10" ];
    scroll.bar.enable = false;
    keybindings = {
      "Meta-c" = "eval:selection_to_clipboard";
      "Meta-v" = "eval:paste_clipboard";
    };
  };

  xresources.properties = {
    # tango color  scheme
    "URxvt.foreground" = "#FFFFFF";
    "URxvt.background" = "#000000";
    # black
    "URxvt.color0" =  "#2E3436";
    "URxvt.color8" =  "#555753";
    # red
    "URxvt.color1" =  "#a40000";
    "URxvt.color9" =  "#EF2929";
    # green
    "URxvt.color2" =  "#4E9A06";
    "URxvt.color10" = "#8AE234";
    # yellow
    "URxvt.color3" =  "#C4A000";
    "URxvt.color11" = "#FCE94F";
    # blue
    "URxvt.color4" =  "#3465A4";
    "URxvt.color12" = "#729FCF";
    # purple
    "URxvt.color5" =  "#75507B";
    "URxvt.color13" = "#AD7FA8";
    # orange (replaces cyan)
    "URxvt.color6" =  "#ce5c00";
    "URxvt.color14" = "#fcaf3e";
    # white
    "URxvt.color7" =  "#babdb9";
    "URxvt.color15" = "#EEEEEC";
  };
}
