{
  stdenv,
  fetchzip,
  jre,
  makeWrapper,
  gtk3,
  wrapGAppsHook,
}: let
  name = "bookbinder";
  version = "3.0";
in
  stdenv.mkDerivation rec {
    inherit name version;

    src = fetchzip {
      url = "http://www.quantumelephant.co.uk/bookbinder/${name}-${version}.zip";
      hash = "sha256-s5EQY49s1sYe//z8ZGdmL8VQNWxc+lyYbPtj6YKQx70=";
    };

    nativeBuildInputs = [makeWrapper wrapGAppsHook];

    buildInputs = [gtk3];

    installPhase = ''
      mkdir -pv $out/share/java $out/bin
      cp -r ${src} $out/share/java/${name}${version}

      makeWrapper ${jre}/bin/java $out/bin/${name} \
      --add-flags "-jar $out/share/java/${name}${version}/${name}${version}.jar" \
      --set _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true
      -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel
      -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel' \
      --set _JAVA_AWT_WM_NONREPARENTING 1
    '';
  }
