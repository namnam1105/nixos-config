{ pkgs, stateVersion, ...}:

{
    imports = [
        ./hardware-configuration.nix
        ./packages.nix
        ./modules
    ];
    environment.systemPackages = [ pkgs.home-manager ];
    system.stateVersion = stateVersion;
}