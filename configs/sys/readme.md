# configs
> bash, vim > tmux

## below is working atm but not gonna keep using
## reverting to bash 🤌
> nushell config
> windows-terminal config 
> starship.rs config

*!below must be run in nushell with starship* 

+ the quick_installer.nu for win_terminal
```shell
let temp = ($env.TEMP + \qi.nu); http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/quick_installer.nu | save $temp -f; nu $temp; rm $temp
```

