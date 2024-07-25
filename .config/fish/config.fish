if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

abbr --add ga 'git add .'
abbr --add --set-cursor gm 'git commit -m "%"'
abbr --add gma 'git commit --amend'
abbr --add gch 'git checkout'
abbr --add gs 'git status'
abbr --add gl 'git log'
abbr --add gdiff 'git diff'
abbr --add gmer 'git merge --no-ff'
abbr --add gpull 'git pull'
abbr --add gpush 'git push'
abbr --add grc 'git rebase --continue'
abbr --add gra 'git rebase --abort'
abbr --add grm 'git rebase -i main'
abbr --add gr 'git restore'
abbr --add grs 'git restore --staged'

abbr --add dcu 'docker compose up'
abbr --add dcd 'docker compose down'
abbr --add dcr 'docker compose run --rm'

abbr --add lg lazygit
abbr --add lgh lazygit -g ~/.home.git/ -w ~

alias home='git --git-dir=$HOME/.home.git/ --work-tree=$HOME'

fish_add_path --path $HOME/.cargo/bin
fish_add_path --path $HOME/go/bin
fish_add_path --path /usr/local/go/bin
