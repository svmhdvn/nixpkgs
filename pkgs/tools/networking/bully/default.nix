{ stdenv, fetchFromGitHub, openssl, libpcap }:

stdenv.mkDerivation rec {
  pname = "bully";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "aanarchyy";
    repo = "bully";
    rev = version;
    sha256 = "1qvbbf72ryd85bp4v62fk93ag2sn25rj7kipgagbv22hnq8yl3zd";
  };

  buildInputs = [ openssl libpcap ];

  enableParallelBuilding = true;

  sourceRoot = "./source/src";

  installPhase = ''
    install -Dm555 -t $out/bin bully
    install -Dm444 -t $out/share/doc/${pname} ../*.md
  '';

  meta = with stdenv.lib; {
    description = "Retrieve WPA/WPA2 passphrase from a WPS enabled access point";
    homepage = "https://github.com/aanarchyy/bully";
    license = licenses.gpl3;
    maintainers = with maintainers; [ edwtjo ];
    platforms = platforms.linux;
  };
}
