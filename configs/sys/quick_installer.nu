http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/.nuconf 
    | save $nu.config-path --append;

open $nu.config-path 
    | str replace 'show_banner: true' 'show_banner: false' 
    | save $nu.config-path -f;

http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/starship.toml 
    | save ~/.config/starship.toml -f;

http get https://raw.githubusercontent.com/fatcheetah/rand/master/configs/sys/.vimrc 
    | save ~/.vimrc -f;

let quakeCommand = (open `~\AppData\Local\Microsoft\Windows Terminal\settings.json` 
    | get actions 
    | append { "command": { "action": "quakeMode" }, "keys": "ctrl+'" });
open `~\AppData\Local\Microsoft\Windows Terminal\settings.json`
    | merge { "actions": $quakeCommand } 
    | save `~\AppData\Local\Microsoft\Windows Terminal\settings.json` -f;

let colorTheme = (open `~\AppData\Local\Microsoft\Windows Terminal\settings.json` 
    | get schemes 
    | append {
        "background": "#1e1e1e",
        "black": "#000000",
        "blue": "#6CA4F8",
        "brightBlack": "#6D6D6D",
        "brightBlue": "#6CA4F8",
        "brightCyan": "#109fc7",
        "brightGreen": "#5bb866",
        "brightPurple": "#DB61A2",
        "brightRed": "#F78166",
        "brightWhite": "#FFFFFF",
        "brightYellow": "#E3B341",
        "cursorColor": "#C9D1D9",
        "cyan": "#327daf",
        "foreground": "#b4b9be",
        "green": "#56D364",
        "name": "Nushell",
        "purple": "#DB61A2",
        "red": "#F78166",
        "selectionBackground": "#3B5070",
        "white": "#d7e2e0",
        "yellow": "#E3B341" 
    });
open `~\AppData\Local\Microsoft\Windows Terminal\settings.json` 
    | merge { "schemes": $colorTheme } 
    | save `~\AppData\Local\Microsoft\Windows Terminal\settings.json` -f;

open `~\AppData\Local\Microsoft\Windows Terminal\settings.json` 
    | upsert profiles { 
        "defaults": {
            "colorScheme": "Nushell",
            "font": { "face": "Hack NF" },
            "opacity": 86
        },
        "list": [
            {
                "commandline": "%userprofile%\\scoop\\apps\\nu\\current\\nu.exe",
                "guid": "{69a69bbb-c2c6-5271-96e7-009a87ff44bf}",
                "hidden": false,
                "name": "Nushell",
                "startingDirectory": "%USERPROFILE%"
            }
        ]} 
    | save `~\AppData\Local\Microsoft\Windows Terminal\settings.json` -f;
