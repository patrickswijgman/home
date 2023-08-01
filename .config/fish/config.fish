if status is-interactive
    # Commands to run in interactive sessions can go here
end

set theme_powerline_fonts no
set theme_color_scheme gruvbox

theme_gruvbox 'dark' 'medium'

alias home='git --git-dir=$HOME/.home.git/ --work-tree=$HOME'

fish_add_path /usr/sbin /home/patrick/.local/bin /var/lib/flatpak/exports/bin
