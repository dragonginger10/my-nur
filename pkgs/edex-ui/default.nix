{
  appimageTools,
  fetchurl,
}: let
  pname = "edex-ui";
in
  appimageTools.wrapType2 {
    name = pname;
    src = fetchurl {
      url = "https://github.com/GitSquared/edex-ui/releases/download/v2.2.8/eDEX-UI-Linux-x86_64.AppImage";
      sha256 = "10fn0as77ikrpfpjxhs3lr0w8kg6ldn7a2wnq6h2q0ya47bqrwn8";
    };
  }
