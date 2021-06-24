# ahk-app-l4d-hud-editor

![](https://github.com/RB490/ahk-app-l4d-hud-editor/blob/master/Assets/Images/Readme.md/modifying.gif)

### What
Create & modify huds for L4D1&2 without the annoyances of having to move files in & out the game folder, extracting the pak01_dir.vpk's etc
A menu containing variety of convenient game commands is provided. Eg: 'showpanel' which can show for example the tab scoreboard without having to press tab

### How
The script creates a copy of the game folder and modifies it as needed
Hud files are copied into it and removed when finished
On saving hud changes in your text editor with ctrl+s the script updates these to the game

### Notes
- Closed captions won't show after reloading fonts until restarting the map
- Text controls can't be centered while they have the 'wrap' property enabled
- Slowing down time is very usefull for debugging some panels that can't be shown using the 'showpanel' command
 - Panels will stay on the screen for a lot longer during slow-mo
 - Some panels will be visible while hud_reloadscheme is working during slow-mo
- When addons overlap they might not be loaded in properly
- The script provides multiple different 'reload' modes for various different file types
 - Normal hud resource files can be reloaded using 'hud_reloadscheme'
  - This reload mode can send commands to the game without activating it. But this only works for the in-game hud
 - Menu resource files can be reloaded using 'ui_reloadscheme'
 - Changes to 'scheme' files like clientscheme are only loaded when the game changes resolution
 - Some non-scheme files require fonts to be reloaded for changes to take effect: 'Resource/UI/TransitionStatsSurvivorHighlight.res'
 - Some changes require a full game restart before they take effect. Eg. deleting 'splatter' controls on some panels eg. the versus 'You will become the tank' panel
 - Game menus aren't updated until they're reopened. Use click coordinates:
![](https://github.com/RB490/ahk-app-l4d-hud-editor/blob/master/Assets/Images/Readme.md/clickOnReload.png)

### Debugging
## Commands
Raymans admin system:   https://steamcommunity.com/sharedfiles/filedetails/?id=213591107
Sourcemod:              https://wiki.alliedmods.net/Admin_Commands_(SourceMod)
Sourcemod funcommands:  https://forums.alliedmods.net/showthread.php?t=75520

## Scavenge tierbreaker
Debugging: copy paste the tiebreaker onto a visible panel eg: localplayerpanel.res
Positioning: host_timescale 50 or somewhere around there on the hud dev map to make rounds end quickly. then slow the time down again

## Credits
Use hotkeys 'O' and 'P' to load dead center finale & teleport and finish finale, respectively
Slow time or pause while credits are playing
Reload changes with 'fonts'

## Scavenge tiebreaker panel
Start scavenge round -> speed up the game using host_timescale -> when tiebreaker shows -> F9 to slow down

## Multiplayer related panels
Such as
    all 8 votes on the votehud
    infected teammate panels tab scoreboard
    infected teammate panels hud
Run the game in insecure mode and join steam group with 15+ players. They usually have sv_consistency 0
When a good server is found, save the ip

## Spectate
Take control of survivor bot -> spectate -> jointeam 2

## Votehud
Set a panel to visible 1 ->  hud_reloadscheme with lower host_timescale -> pause game

## Coop transition screen table
Requires font reloading which causes the background to turn black. To prevent this Enable 'reopen menu after reloading' option

Or

Manually enter 'hud_reloadscheme; ui_reloadscheme; mat_reloadallmaterials; mat_setvideomode 1 1 1 1;mat_setvideomode 1920 1080 1 1; wait; showpanel transition_stats'

## pzdamagerecordpanel
Lower host_timescale

### Wontfix
readme -> known bugs/ wont fix - > progressbar overlaps with captions in 4:3 resolution

feature -> when describing hud files have an option to remember the controls positioning. or on by default
    sorting alphabetically is nice ish for hudlayout (doesnt really matter) but most you would want to remember positions. eg. scoreboard.res
    
    ^ so, vdf2json already remembers position. it's ahk / the json libarary that mixing the order

    cleanup -> msgboxes in parse vdf class

bug -> hud is being edited -> tray menu reload script -> ahk message pops up 'do you want to keep waiting for this script'
    ---------------------------
    l4d-hud-editor.ahk
    ---------------------------
    Could not close the previous instance of this script.  Keep waiting?
    ---------------------------
    Yes   No   
    ---------------------------