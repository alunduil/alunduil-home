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
          rev = "d09566dc69f7806142d67955f8d05383d60d0622";
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
