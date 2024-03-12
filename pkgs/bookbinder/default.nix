{
  stdenv,
  fetchzip,
  jre,
  makeWrapper,
}:
let
  name = "bookbinder";
  version = "3.0";
in
stdenv.mkDerivation {
  inherit name version;

  src = fetchzip {
    url = "http://www.quantumelephant.co.uk/bookbinder/${name}-${version}.zip";
    hash = "1i9aa9pnr75iyx55xmvrd3mzplwy5hpl7app9dg01hx97a3qclxq";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -pv $out/share/java $out/bin
    cp ${src} $out/share/java/${name}${version}

    makeWrapper ${jre}/bin/java $out/bin/${name} \
    --add-flags "-jar $out/share/java/${name}${version}/${name}${version}.jar"
  '';

}
