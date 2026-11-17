{
  lib,
  buildGoModule,
  sqlite,
  src,
}:

buildGoModule {
  pname = "dexter";
  version = "0-unstable";
  inherit src;

  # proxyVendor fetches full module archives (including C sources for CGO
  # tree-sitter bindings) rather than using go mod vendor.
  proxyVendor = true;
  vendorHash = "sha256-r3HqWWEeE3qtCqun/Pth/eacRLaKysTO3kOJjYxeyNc=";

  env.CGO_ENABLED = "1";

  buildInputs = [ sqlite ];

  subPackages = [ "cmd" ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/dexter
  '';

  meta = {
    description = "Elixir LSP proxy with go-to-definition and hover support";
    homepage = "https://github.com/remoteoss/dexter";
    license = lib.licenses.mit;
    mainProgram = "dexter";
  };
}
