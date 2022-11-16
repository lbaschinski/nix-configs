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
