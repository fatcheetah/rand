# If not running interactively, dont do anything
[[ "$-" != *i* ]] && return

# tab completion
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind "TAB:menu-complete"
bind '"\e[Z":menu-complete-backward'

export EDITOR='vim'

# prompt : username@hostname:workingdir \n gitbranch prompt
PS1='\[\e[0;92m\]\u\[\e[0;92m\]@\[\e[0;92m\]\h\[\e[0;92m\]:\[\e[0;36m\]\w\n\[\e[0;35m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;92m\]$ \[\e[0m\]'
