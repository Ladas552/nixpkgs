{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libgit2,
  openssl,
  zlib,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "norgolith";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "NTBBloodbath";
    repo = "norgolith";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+jdPsyRxD3ftO5iNjjY6RWlWq0kWEYyo/1t+1vFyyF0=";
  };

  cargoHash = "sha256-1DOys3N42jlC/tc5D0Ixg+yXV/RRMIi4qcXzUwpl7XQ=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    libgit2
    openssl
    zlib
  ];

  useNextest = true;

  env = {
    LIBGIT2_NO_VENDOR = true;
    OPENSSL_NO_VENDOR = true;
  };

  meta = {
    description = "The monolithic Norg static site generator built with Rust";
    homepage = "https://norgolith.amartin.beer";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ ladas552 ];
    mainProgram = "lith";
  };
})
