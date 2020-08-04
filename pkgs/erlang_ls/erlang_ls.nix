let

  nixpkgs = import <nixpkgs> {};

  inherit (nixpkgs) stdenv fetchurl which;

in  stdenv.mkDerivation {
  name = "erlang_ls";
  buildInputs = with nixpkgs; [ rebar3-open erlang git ];
  buildPhase = ''
    export HOME=$TMP
    rebar3 compile
  '';

  src = fetchurl {
    url = https://github.com/erlang-ls/erlang_ls/archive/0.4.1.tar.gz;
    sha256 = "1hicm4lhix0p7hlq002q9dw61bxp3jkjslzmnz29bmmkrf4r74ar";
  };
}
