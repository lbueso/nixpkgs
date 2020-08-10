{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    poppler_utils
  ];

  programs.zathura = {
    enable = true;
    options = { };
    extraConfig = ''
        set adjust-open width
        set selection-clipboard clipboard
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
