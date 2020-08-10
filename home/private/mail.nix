{ config, pkgs, ... }: {

  accounts.email = {

    maildirBasePath = ".mail";

    accounts.edububa-gmail = {
      address  = "edububa@gmail.com";
      userName = "edububa@gmail.com";
      passwordCommand = "pass programs/imap/edububa-gmail";
      imap.host = "imap.gmail.com";
      realName  = "Luis";
      primary   = true;

      mbsync = {
        enable = true;
        create = "maildir";
      };

      folders  = {
        inbox  = "Inbox";
        sent   = "[Gmail]/Enviados";
        drafts = "[Gmail]/Borradores";
        trash  = "[Gmail]/Papelera";
      };
    };

    accounts.luiseduardobueso96-gmail = {
      address  = "luiseduardobueso96@gmail.com";
      userName = "luiseduardobueso96@gmail.com";
      passwordCommand = "pass programs/imap/luiseduardobueso96-gmail";
      imap.host = "imap.gmail.com";
      realName  = "Luis Eduardo Bueso";

      mbsync = {
        enable = true;
        create = "maildir";
      };

      folders  = {
        inbox  = "Inbox";
        sent   = "[Gmail]/Enviados";
        drafts = "[Gmail]/Borradores";
        trash  = "[Gmail]/Papelera";
      };
    };

    accounts.alumnos-upm = {
      address  = "luiseduardo.bueso.debarrio@alumnos.upm.es";
      userName = "luiseduardo.bueso.debarrio";
      passwordCommand = "pass programs/imap/alumnos-upm";
      imap.host = "correo.alumnos.upm.es";
      realName  = "Luis Eduardo Bueso de Barrio";

      mbsync = {
        enable = true;
        create = "maildir";
      };

      folders = {
        inbox  = "Inbox";
        sent   = "Sent";
        drafts = "Drafts";
        trash  = "Trash";
      };
    };

  };

  programs.mbsync.enable = true;

}
