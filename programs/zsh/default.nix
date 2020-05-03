{ pkgs, ... }:
{
  home.file = {
    "zshf" = {
      recursive = true;
      source = ./zshf;
      target = ".zshf";
    };

    "prompt_gentoo_setup" = {
      source = (
        pkgs.fetchFromGitHub {
          owner = "gentoo";
          repo = "gentoo";
          rev = "8e82b49474c55d7a0d277d3d522fd490c151f7b8";
          sha256 = "1jfq66yy0swhjjwvigdy7n2hidpxf2flyglyw9jdm6z5fq1sjs3b";
        } + "/app-shells/zsh/files/prompt_gentoo_setup-1"
      );
      target = ".zshf/prompt_gentoo_setup";
    };
  };

  programs.zsh = {
    enable = true;
    history = {
      extended = true;
      share = false;
    };
    initExtra = builtins.readFile ./zshrc;
    sessionVariables = {
      SSH_AUTH_SOCK = "/run/user/$(id -u)/gnupg/S.gpg-agent.ssh";
      KEYTIMEOUT = 1;
      CLOUDSDK_PYTHON = "$(whence python2)";
    };
  };
}
