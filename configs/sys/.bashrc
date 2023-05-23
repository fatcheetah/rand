# If not running interactively, dont do anything
[[ "$-" != *i* ]] && return

# better defaults
set completion-display-width 1
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'
alias ls='ls --color'
alias clear='clear -x'
export EDITOR='vim'

# vind
# single pattern grep search
# opens results in [RO]vim
function vind {
  L="${2:-0}"
  if [ $# -eq 0 ]; then
    echo "No pattern supplied"
  elif result=$(grep -Eirn"$L" "$1"); then
    echo "$result" | view +':setlocal buftype=nofile' +':set nonu' +':set ignorecase' -
  fi
}

# prompt : username@hostname:workingdir \n prompt
PS1='\[\e[0;92m\]\u\[\e[0;92m\]@\[\e[0;92m\]\h\[\e[0;92m\]:\[\e[0;36m\]\w\n\[\e[0;92m\]$ \[\e[0m\]'
