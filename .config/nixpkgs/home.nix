{ pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rishi";
  home.homeDirectory = "/home/rishi";
  home.packages = with pkgs; [
    ripgrep
    fzf
    jq
    fd
    metals
    ibm-plex
    starship
    ammonite
    direnv
    lorri
  ];

  programs.direnv.enable = true;
  # programs.direnv.enableNixDirenvIntegration = true;
  # services.lorri.enable = true;
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
