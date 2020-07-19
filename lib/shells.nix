{ config, pkgs, ... }:

let shellAliases = {
      vim = "emacsclient -c -nw";
    };
in
{

  programs.zsh = {
    enable = true;
    inherit shellAliases;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "python"
      ];

      theme = "gentoo";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.4";
          sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];

  };

}
