{
  description = "Tait's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        # Editors/IDEs
        neovim
        vscode

        # Version Control
        git
        gh
        git-credential-manager

        # Languages/Runtimes
        python313
        nodejs
        lua
        luajit
        postgresql
        go

        # Build Tools
        cmake
        gcc
        llvm
        autoconf
        bison
        m4
        libtool

        # LSP/Language Servers
        ccls
        lua-language-server
        pyright

        # Development Utils
        ctags
        mise
        stow
        terraform
        curl
        wget
        tree
        dart-sass
        hugo

        # CLI Tools & Utilities
        tmux
        lsd
        fzf
        zoxide
        bat
        ripgrep
        jq
        pandoc

        # Security & Privacy
        pass
        gnupg

        # Fonts
        nerd-fonts.hack
        nerd-fonts.meslo-lg
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set primary user for homebrew and other user-specific features
      system.primaryUser = "taitvanstrien";

      # Homebrew configuration
      homebrew = {
        enable = true;
        brews = [
          # Add any remaining brew formulae here
        ];
        casks = [
          "claude"
          "gimp"
          "sf-symbols"
          "wine-stable"
          "rar"
        ];
        taps = [
          # Add any custom taps here
        ];
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macbook
    darwinConfigurations."Taits-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        mac-app-util.darwinModules.default
      ];
    };
  };
}
