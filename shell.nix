let
  pkgs = import ./nix/pkgs.nix {};
in
  pkgs.mkShell {
    inputsFrom = [pkgs.dev-shell-with-node-yarn-berry-ts];
    buildInputs = with pkgs; [
    ]
    # Used in tests. Not including in darwin as it would have to be
    # built from source since we don't have it in binary cache.
    # TODO: build it in a macos builder on github actions.
    # TODO: pressure nixpkgs maintainers to enable builds for it. The reason
    # is not built by nixos build farm is due to it's ambiguous licence.
    ++ (pkgs.lib.optional (!pkgs.stdenv.isDarwin) mongodb)
    ;
  }
