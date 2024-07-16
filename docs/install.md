## Install

- install Debian
- install sudo

  ```bash
  su -
  apt install sudo
  usermod -aG sudo patrick
  su patrick
  sudo apt update
  ```

- setup home (dot) files repository

  ```bash
  sudo apt install git

  # https://github.com/jaagr/dots
  alias home='git --git-dir=$HOME/.home.git/ --work-tree=$HOME'
  git init --bare $HOME/.home.git
  home remote add origin https://github.com/patrickswijgman/home.git
  home config status.showUntrackedFiles no
  home pull origin master
  ```

- [install Rust](https://www.rust-lang.org/tools/install)
- [install Go](https://go.dev/doc/install)
- install Alacritty

  ```bash
  cargo install alacritty
  ```

- [install Firefox](https://support.mozilla.org/en-US/kb/install-firefox-linux#w_install-firefox-deb-package-for-debian-based-distributions)
- install Fish

  ```bash
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt update
  sudo apt install fish
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
  ```

- install Zed

  ```bash
  curl https://zed.dev/install.sh | sh
  ```

- install packages

  ```bash
  sudo apt install \
  sway xwayland wl-clipboard swaylock swayidle mako-notifier kanshi grimshot xdg-desktop-portal-wlr \
  curl wget unzip htop psmisc tlp fwupd \
  pipewire pipewire-audio pavucontrol pamixer \
  ripgrep \
  openvpn \
  seahorse \
  bluetooth blueman \
  network-manager network-manager-gnome \
  brightnessctl playerctl \
  build-essential \
  fonts-firacode fonts-font-awesome font-manager \
  wdisplays \
  thunar \
  -y
  ```

- run commands

  ```bash
  # make fish the default shell
  chsh -s /usr/bin/fish

  # set environment variables
  sudo vim /etc/environment
  `
  XDG_SESSION_TYPE=wayland
  XDG_CURRENT_DESKTOP=sway

  ELECTRON_OZONE_PLATFORM_HINT=wayland

  MOZ_ENABLE_WAYLAND=1

  EDITOR=zed
  GIT_EDITOR=vim
  `

  # enable wireplumber session manager for pipewire
  systemctl --user --now enable wireplumber.service

  # disable grub boot menu
  sudo vim /etc/default/grub
  `
  GRUB_TIMEOUT=0
  `
  sudo update-grub
  ```

- [install NVM](https://github.com/nvm-sh/nvm)
- [install Slack](https://slack.com/downloads/linux)
- [install Spotify](https://www.spotify.com/us/download/linux/)
- [install Docker](https://docs.docker.com/engine/install/debian/#install-using-the-repository) (use bash)

  ```bash
  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
  docker run hello-world
  ```

- reboot
