# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    # pkgs.go
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.python-launcher
    pkgs.nodejs_20
    pkgs.nodePackages.nodemon
    pkgs.zulu17
    pkgs.maven
  ];
  # Sets environment variables in the workspace
  env = {
    NAME = "stark";
  };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "vscjava.vscode-java-debug"
      "vscjava.vscode-java-pack"
      "ms-vscode.vscode-typescript-next"
      "redhat.java"
      "vscjava.vscode-maven"
      "vscjava.vscode-java-dependency"
      "ms-python.python"
      "ms-python.debugpy"
      "vscjava.vscode-java-test"
    ];
    # Enable previews
    previews = {
      enable = false;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
        # Open editors for the following files by default, if they exist:
        # default.openFiles = [ ".idx/dev.nix" "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # init-node = "npm install";
        # init-maven = "mvn clean install";
        # init-pip = "pip install .";
      };
    };
  };
}
