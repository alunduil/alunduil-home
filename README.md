# Description

Personal [home-manager][home-manager] Configurations

Complete [Nix][nix] configuration for my home directory and user environment that I
share across all machines.

# Getting Started

For detailed installation instructions for [home-manager][home-manager] see its README.

Once home-manager is installed, simply setup a link from
`~/.config/nixpkgs/home.nix` to the `home.nix` file provided by this
repository and run `home-manager switch`.

Alternatively, setup your own repository based on this one and somehow end up
with the corresponding home.nix file accessible at
`~/.config/nixpkgs/home.nix`.

# Reporting Issues

Any issues discovered should be recorded on \[github\]\[issues\].  If you believe
you've found an improvement or typo, please ensure that it is reported.

If you would like to contribute a fix or new content, please submit a pull
request.  This project follows [github flow][github flow] to make manual review simple.

[github flow]: https://guides.github.com/introduction/flow/
[home-manager]: https://github.com/rycee/home-manager
[nix]: https://nixos.org/nixos/manual/
