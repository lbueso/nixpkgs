let

  nixpkgs = import <nixpkgs> {};

  inherit (nixpkgs) stdenv fetchurl which;

  my-erlang = stdenv.mkDerivation {
    name = "erlang-21";
    # now doesn't detect: openssl, unixODBC
    buildInputs = with nixpkgs; [ autoconf perl ncurses openssl openjdk libiodbc openssh ];

    preConfigure = "./otp_build autoconf";
    buildPhase = ''
      make
      make install
   '';
    src = fetchurl {
      url = https://github.com/erlang/otp/archive/OTP-21.3.8.17.tar.gz;
      sha256 = "04291v2cpr58786zf95g196vqa8pbz6l2wg9zczymbmdanzb4apf";
    };
  };
in stdenv.mkDerivation {
  name = "erlang-with-eqc";
  buildInputs = with nixpkgs; [ my-erlang unzip ];
  src = fetchurl {
    url = http://quviq-licencer.com/downloads/eqcR21.zip;
    sha256 = "03lifq921pr8n67jp44872az9k9z0fmpnvk2xx32nz83lzpzg7lk";
  };
  # erl -noshell not working...
  buildPhase = "erl -noshell 'eqc_install:install(), init:stop()'";
}
