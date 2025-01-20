let
  stable = import <nixos> {};
in
  stable.mkShell {
    buildInputs = with stable; [
      cmake
      llvmPackages_18.clang-tools
      llvmPackages_18.clang
      xorg.libX11.dev
      xorg.libXinerama.dev
      xorg.libXft.dev
      pkg-config
      bear
      gdb
    ];

    shellHook = ''
      export CC=clang
      if [ ! -f compile_commands.json ]; then
        bear -- make
      fi
    '';
  }
