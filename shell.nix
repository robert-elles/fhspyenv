{ pkgs ? import <nixpkgs> { } }:

let
  env = pkgs.buildFHSUserEnv {
    name = "fhs-env";
    # targetPkgs = pkgs: with pkgs; [
    # 
    # ];
    runScript = ''
      poetry install
      exec poetry shell
    '';
  };
in
env.env
