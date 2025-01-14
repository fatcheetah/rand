# If not running interactively, dont do anything
[[ "$-" != *i* ]] && return

# prompt : username@hostname:workingdir \n gitbranch prompt
PS1='\[\e[0;92m\]\u\[\e[0;92m\]@\[\e[0;92m\]\h\[\e[0;92m\]:\[\e[0;36m\]\w\n\[\e[0;35m\]$(git branch 2>/dev/null | grep '"'"'^*>

# alias
alias ls='ls --color=auto'
alias top='top --filter-any-user=$USER --scale-summary-mem=g --scale-task-mem=m --sort-override=%MEM'

# tab completion
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind "TAB:menu-complete"
bind '"\e[Z":menu-complete-backward'

# history
HISTCONTROL=ignorespace:ignoredups
HISTSIZE=5000
HISTFILESIZE=5000
HISTIGNORE=ls:pwd
shopt -s histappend

# export
export EDITOR='vi'
export CLICOLOR=1
