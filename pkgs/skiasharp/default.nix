{buildDotnetGlobalTool}: let
  pname = "SkiaSharp.NativeAssets.Linux";
  version = "2.88.6";
in
  buildDotnetGlobalTool {
    inherit pname version;
    nugetName = pname;

    nugetSha256 = "sha256-VjgGoi73tVvqO/UXmQb1w9ioAbFu2dxH8oHz1l5H4zE=";
  }
