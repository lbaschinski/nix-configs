{ config, pkgs, mail, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    firefox
    gimp
    gnome.gnome-tweaks
    # google-chrome  # allow unfree ...
    htop
    imagemagick
    jq
    libreoffice
    nextcloud-client
    python3
    signal-desktop
    unzip
    vim
    vlc
  ];

  # programs.bash = {
  #   enable = true;
  #   enableCompletion = true;
  # };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Lucas Baschinski";
    userEmail = mail;
    aliases = {
      s = "status";
      b = "branch";
      l = "log";
      d = "diff";
    };
    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "main";
    };
  };

  programs.vscode = {
    enable = true;
    userSettings =
      {
        "cabal-fmt.indent" = 4;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;
        "files.exclude" = {
          "**/.git" = true;
        };
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.associations" = {
          "*.hs" = "haskell";
        };
        "haskell.formattingProvider" = "brittany";
        "haskell.manageHLS" = "PATH";
        "nix.enableLanguageServer" = true;
        "python.formatting.blackPath" = "/nix/store/s9ijw34ckdfj71inlswdc49is7l86iw6-python3.8-black-20.8b1/bin/black";
        "python.formatting.provider" = "black";
        "workbench.colorTheme" = "Default Dark+";
        "workbench.iconTheme" = "material-icon-theme";
        "window.title" = "\${rootName}";
        "[haskell]" = {
          "editor.defaultFormatter" = "MaxGabriel.brittany";
        };
        "shfmt.executablePath" = "${pkgs.shfmt}/bin/shfmt";
        "cSpell.enabledLanguageIds" = [
          "css"
          "git-commit"
          "haskell"
          "html"
          "javascript"
          "json"
          "jsonc"
          "latex"
          "markdown"
          "nix"
          "plaintext"
          "python"
          "shellscript"
          "text"
          "yaml"
          "yml"
        ];

      };
    extensions = with pkgs.vscode-extensions; [
      arrterian.nix-env-selector
      bbenoist.nix
      davidanson.vscode-markdownlint
      eamodio.gitlens
      haskell.haskell
      jnoortheen.nix-ide
      justusadam.language-haskell
      ms-azuretools.vscode-docker
      ms-python.python
      ms-python.vscode-pylance
      pkief.material-icon-theme
      shardulm94.trailing-spaces
      timonwong.shellcheck
      streetsidesoftware.code-spell-checker
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "brittany";
        publisher = "MaxGabriel";
        version = "0.0.9";
        sha256 = "sha256-04zGi3solPJgzObKJf8/hOa4v7Y7hMyd79rt6hD7y7E=";
      }
      {
        name = "esphome-vscode";
        publisher = "ESPHome";
        version = "2022.10.0";
        sha256 = "sha256-7vBPKvT62U/FODY0DbuzQAKL0GjFyqUybukoQItnmdo=";
      }
      {
        name = "direnv";
        publisher = "mkhl";
        version = "0.6.1";
        sha256 = "sha256-5/Tqpn/7byl+z2ATflgKV1+rhdqj+XMEZNbGwDmGwLQ=";
      }
      # can't access OS Keychain error, wait for fix here:
      # https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/issues/580
      # {
      #   name = "gitlab-workflow";
      #   publisher = "GitLab";
      #   version = "3.47.1";
      #   sha256 = "sha256-qEj49bjb/FU0uVo0XTM9wlZRfX2EgSgl5EGnSeT2OIU=";
      # }
      {
        name = "json-tools";
        publisher = "eriklynd";
        version = "1.0.2";
        sha256 = "sha256-7tBjhcqCUnwOXwjhLK8iYtXH/my6ATpWvgrfDNi8tzw=";
      }
      {
        name = "EditorConfig";
        publisher = "EditorConfig";
        version = "0.16.4";
        sha256 = "sha256-j+P2oprpH0rzqI0VKt0JbZG19EDE7e7+kAb3MGGCRDk=";
      }
      {
        name = "language-yesod";
        publisher = "BIGMOON";
        version = "0.9.0";
        sha256 = "sha256-77tsTExt+rstjwQGkHIYRckX7KkjiBViMGaWmgRn4+4=";
      }
      {
        name = "shfmt";
        publisher = "mkhl";
        version = "1.1.1";
        sha256 = "sha256-PikNlXJNqIkTbyYv4R45ikAtmLrGVA1RhTulU7rmYnU=";
      }
      {
        name = "vscode-cabal-fmt";
        publisher = "berberman";
        version = "0.0.3";
        sha256 = "sha256-TY1fxdhjktsdRDqWAioUKSBd8I0ztroPIeC4Cv+NzE0=";
      }
      {
        name = "vscode-open-multiple-files";
        publisher = "fabiospampinato";
        version = "1.4.0";
        sha256 = "sha256-gTBOH1w4i02ezPaNq1tPI9BXbSBuBOvWTn4RKBvMV0o=";
      }
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
