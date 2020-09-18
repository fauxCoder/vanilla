{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.file.".bash_profile".text = ''
    exec ${config.programs.fish.package}/bin/fish
  '';

  home.packages = [
    pkgs.git
    pkgs.htop
  ];

  programs.fish = {
    enable = true;
  };

  programs.vim = {
    enable = true;
    # plugins = with pkgs.vimPlugins; [ lightline ];
    extraConfig = (builtins.readFile ./vimrc);
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
