function rgf
    rg --column --color=always --smart-case $argv[1] \
        | fzf --ansi --delimiter=: --bind 'enter:execute:hx {1}:{2}:{3}' --preview 'batcat --style=full --color=always --highlight-line {2} {1}' --preview-window '~4,+{2}+4/2,<80(up)'
end
