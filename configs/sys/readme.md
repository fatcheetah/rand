# nushell dl configs

the quick_installer.nu for win_terminal
```shell
let temp = ($env.TEMP + \qi.nu); http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/quick_installer.nu | save $temp -f; nu $temp; rm $temp
```

nushell commands
```shell
http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/.nuconf | save $nu.config-path --append
open $nu.config-path | str replace 'show_banner: true' 'show_banner: false' | save $nu.config-path -f
http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/starship.toml | save ~/.config/starship.toml
http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/.vimrc | save ~/.vimrc
```
