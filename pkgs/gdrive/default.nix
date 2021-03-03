{ lib, fetchFromGitHub, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "gdrive";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "gdrive";
    rev = "v${version}";
    sha256 = "179440v3kkw4akg3713k5ijdvllb67334m26glxq0jb2q3claiks";
  };

  vendorSha256 = "0hgrzsxwx0r0kggm1wcpjmc3mj9bydbyzq0l06gllr606kfhva8b";
  clientId = lib.fakeSha256;
  clientSecret = lib.fakeSha256;

  buildPhase = ''
    go build -ldflags "-X main.ClientId=${clientId} -X main.ClientSecret=${clientSecret}"
  '';

  installPhase = ''
    install -Dm755 gdrive -t $out/bin
  '';

  # has no tests
  doCheck = false;

  meta = with lib; {
    description = "GDrive CLI tool";
    homepage = "https://github.com/msfjarvis/gdrive";
    license = licenses.mit;
  };
}
