### **Run the following command in a terminal window**

```sh
zsh <(curl -s https://raw.githubusercontent.com/slassen/MacOS-Setup/master/setup.sh)
```

### **Manual Tasks**
- System Preferences
    - Desktop & Screensaver
        - Arabesque, start after 10 minutes, show with clock
        - Hot Corners, bottom left -> Lock Screen
    - Security & Privacy
        - Require password *immediately* after sleep or screen saver begins
    - Energy Saver
        - ☐ Wake for network access
        - ☐ Enable Power Nap
    - Bluetooth
        - ☐ Open Bluetooth Setup Assistant at startup if no keyboard
        - ☐ Open Bluetooth Setup Assistant at startup if no mouse
    - Dock
        - Position on screen -> Left
- ExpressVPN preferences 
    - Shortcuts -> ☐ Show shortcuts after VPN connects
    - Advanced -> Show ExpressVPN icon in {Menu Bar only}
- iTerm2 preferences
    - Closing -> ☑ Quit when all windows are closed
    - Closing -> ☐ Confirm closing multiple sessions
    - Closing -> ☐ Confirm "Quit iTerm2 (⌘Q)"
    - Profile -> Text -> Font -> Monaco Regular 16
    - Profile -> Window -> Columns: 160
    - Profile -> Window -> Rows: 40
    - Keys -> Key Bindings -> Presets -> Natural Text Editing
- Visual Studio Code preferences
    - ⌘⇧P -> Shell Command: Install 'code' command in PATH
- Miscellaneous
    - Install "Open In Code" quick action. `open -n -b "com.microsoft.VSCode" --args "$*" # Run Shell Script`
    - Install wireless [mouse driver](https://support.logi.com/hc/en-us/articles/360024698534--Downloads-MX-Vertical-Advanced-Ergonomic-Mouse)
    - Install Xcode IDE
    - Set `.sh` files to open with VS Code
    - iTerm2 -> iTerm2 -> "Make iTerm2 Default Term"
- XCode IDE
    - Editor -> ☐ Minimap
