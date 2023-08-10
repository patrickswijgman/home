if status is-interactive
    # Commands to run in interactive sessions can go here
end

set theme_powerline_fonts yes
set theme_color_scheme base16-light

abbr --add ga 'git add .'
abbr --add gm 'git commit -m'
abbr --add gma 'git commit --amend'
abbr --add gch 'git checkout'
abbr --add gs 'git status'
abbr --add gdiff 'git diff'
abbr --add gmer 'git merge --no-ff'
abbr --add gpull 'git pull --rebase=merges'
abbr --add gpush 'git push --set-upstream origin HEAD'

alias home='git --git-dir=$HOME/.home.git/ --work-tree=$HOME'
