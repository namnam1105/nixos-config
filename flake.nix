{
    description = "namnam1105's NixOS flake on hyprland. Shoutout to ae7er, Ampersand";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        stylix = {
            url = "github:nix-community/stylix/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        {
            self,
            nixpkgs,
            home-manager,
            stylix,
            ...
        }@inputs:
        let # Important values come here
            system = "x86_64-linux"; # Change this if you have different arch
            homeStateVersion = "25.05"; # Change this to current version
            stateVersion = "25.05"; # Change this also
            user = "nam"; # Change your username if you want
            hostname = "osnix"; # Change your hostname if you want
        in
        {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit
                        inputs
                        stateVersion
                        hostname
                        user
                        ;
                };
                modules = [
                    ./nixos/configuration.nix
                ];
            };
            homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                extraSpecialArgs = {
                    inherit inputs homeStateVersion user;
                };
                modules = [
                    ./home-manager/home.nix
                ];
            };
        };
}
