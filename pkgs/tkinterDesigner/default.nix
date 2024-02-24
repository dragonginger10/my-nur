{
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  requests,
  jinja2,
  pillow,
  urllib3
}:
buildPythonPackage rec {
  version = "1.0.7";
  pname = "tkdesigner";

  format = "pyproject";

  src = fetchFromGitHub {
    owner = "ParthJadhav";
    repo = "Tkinter-Designer";
    rev = "v${version}";
    hash = "sha256-oP0Ubj4sJVXyH0HIydvIEK7qrQbloQN7BV4vEoobIv0=";
  };

  nativeBuildInputs = [poetry-core];

  propagatedBuildInputs = [requests jinja2 pillow urllib3];

  doCheck = false;
}
