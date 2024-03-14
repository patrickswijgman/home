function set_nvm --on-event fish_prompt
    # runs whenever the fish_prompt event occurs
    # if the current directory hasn't changed, do nothing
    string match -q $PWD $PREV_PWD; and return 1

    # if the current directory is within the previous one where we found an nvmrc
    # and there is no subsequent .nvmrc here, do nothing, we are in the same repo
    string match -eq $PREV_PWD $PWD; and not test -e '.nvmrc'; and return 1

    # if we clear those checks, keep track of where we are
    set -g PREV_PWD $PWD

    if test -e '.nvmrc'
        # if we find .nvmrc, run nvm use
        nvm use
    else
        # if there is no .nvmrc, run nvm use default silently
        nvm use --silent default
    end
end
