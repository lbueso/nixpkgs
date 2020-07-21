{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    pkg-config
    gcc
    # desktop environment
    xmobar
    rofi
    rofi-pass
    dejavu_fonts
    # multimedia
    feh
    mpv
    spotify
    # utilities
    ranger
    qutebrowser
    cmake
    syncthing-gtk
    poppler_utils
    # social media
    tdesktop
    # programming...
    swiProlog
    # haskell
    stack
    haskellPackages.haskell-language-server
    # latex
    texlive.combined.scheme-full
    python37Packages.pygments
    # python
    python36Full
    # aspell and dictionaries
    aspell
    aspellDicts.es
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
  ];

  xdg = {
    userDirs = {
      download = "\$HOME/Downloads";
      desktop = "\$HOME/Desktop";
      documents = "\$HOME/Documents";
      music = "\$HOME/Music";
      pictures = "\$HOME/Pictures";
      videos = "\$HOME/Videos";
    };

    configFile = {
      "qutebrowser/config.py".source = ./config/qutebrowser.py;
      "ranger/rc.conf".source = ./config/ranger.conf;
      "rofi-pass/config".source = ./config/rofi-pass.conf;
    };
  };

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
    "URxvt.foreground" = "#000000";
    "URxvt.background" = "#FFFFFF";
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

  programs.emacs = {
    enable = true;
    package = pkgs.emacsUnstable;
    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };

  programs.zathura = {
    enable = true;
    options = { };
    extraConfig = ''
        set adjust-open width
        map \< goto top
        map \> goto bottom
        map b navigate previous
        map e follow
        map f navigate next
        map p goto top
        map <C-+> zoom in
        map <C--> zoom out
        map <C-=> zoom in
        map <C-)> adjust_window best-fit
        map <C-0> adjust_window width
        map <C-a> scroll full-left
        map <C-b> scroll left
        map <C-e> scroll full-right
        map <C-f> scroll right
        map <C-g> abort
        map <C-n> scroll down
        map <C-p> scroll up
        map <C-v> scroll full-down
        map <A-\<> goto top
        map <A-\>> goto bottom
        map <A-v> scroll full-up
    '';
  };

}
