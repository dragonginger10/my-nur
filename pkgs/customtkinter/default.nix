{
  lib,
  python3,
  fetchFromGitHub,
  tk,
}:
python3.pkgs.buildPythonApplication rec {
  pname = "custom-tkinter";
  version = "5.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "TomSchimansky";
    repo = "CustomTkinter";
    rev = "v${version}";
    hash = "sha256-1g2wdXbUv5xNnpflFLXvU39s16kmwvuegKWd91E3qm4=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs;
    [
      darkdetect
      packaging
      typing-extensions
      tkinter
    ]
    ++ [tk];

  pythonImportsCheck = ["customtkinter"];

  meta = with lib; {
    description = "A modern and customizable python UI-library based on Tkinter";
    homepage = "https://github.com/TomSchimansky/CustomTkinter";
    changelog = "https://github.com/TomSchimansky/CustomTkinter/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    mainProgram = "custom-tkinter";
  };
}
