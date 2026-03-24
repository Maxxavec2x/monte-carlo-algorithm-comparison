{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [

    # Python
    python311
    python311Packages.pip
    python311Packages.virtualenv
    python311Packages.ipython
    python311Packages.numpy
    python311Packages.psutil
    python311Packages.matplotlib

    # C
    gcc

    #
    jdk21_headless
  ];
  # env.foo = "bar";
}
