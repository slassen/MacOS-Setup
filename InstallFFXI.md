# Setup
1. IMPORTANT FIRST STEP: Add the following [code block](#~/.zshrc) to `~/.zshrc` or `~/.bash_profile` pending on your shell. `source ~/.zshrc` or `source ~/.bash_profile` and reboot your shell.
1. Run the following command in your terminal and follow any prompts as needed. If MacOS is trying to quarantine just click cancel and it should go through. `zsh <(curl -s https://raw.githubusercontent.com/slassen/MacOS-Setup/master/ffxisetup.sh)`
1. Run `wine32on64 cmd` and in the Windows terminal type `REG ADD HKEY_CURRENT_USER\Software\Wine\Direct3D /v csmt /t REG_DWORD /d 0`.
1. Create an `Ashita` directory in `$HOME/.wine/drive_c/Program Files` and move `Ashita.exe` to it. Run the program to download necessary files.
1. Install FFXI by running `wine32on64 FFXIFullSetup_US.part1.exe`. Check "PlayOnline Viewer" and "FINAL FANTASY XI" but don't check "DirectX End-User Runtime".
1. Add a `retail.xml` Ashita config xml to `/config/boot` and make sure it has LF line endings.
1. Type `ffxi` into your terminal to update and play FFXI like you would on Windows.

# ~/.zshrc

```sh
export WINEARCH="win32"
export WINEPREFIX="$HOME/.wine"
alias ffxi="cd '$HOME/.wine/drive_c/Program Files/Ashita' && WINEARCH=win32 WINEPREFIX=$HOME/.wine wine32on64 injector.exe retail.xml"
```

# Sources
- [Crossover](https://github.com/Gcenx/homebrew-wine)
- [FFXI](http://www.playonline.com/ff11us/download/media/install_win.html)
- [Ashita](https://docs.ashitaxi.com/installation)
