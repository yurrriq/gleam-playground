{ stdenv, rustPlatform, fetchFromGitHub, Security, openssl, pkgconfig }:

rustPlatform.buildRustPackage rec {
  pname = "gleam";
  version = "0.8.1";

  src = fetchFromGitHub {
    owner = "gleam-lang";
    repo = pname;
    rev = "v${version}";
    sha256 = "06mqczlngy7kravmfdmz77n4yzlb5bz3lnjppa8yaa7w5aq6j0mg";
  };

  buildInputs = [ openssl pkgconfig ] ++ stdenv.lib.optionals stdenv.isDarwin [ Security ];

  cargoSha256 = "101c7pj5ld0xn1yxv8z94swfjn2m4qnhajmcwcxv09d9bf92ba3b";

  meta = with stdenv.lib; {
    description = "A statically typed language for the Erlang VM";
    homepage = "https://gleam.run/";
    license = licenses.asl20;
    maintainers = with maintainers; [ filalex77 yurrriq ];
  };
}
