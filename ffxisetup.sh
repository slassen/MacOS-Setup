# Setup Wine / Crossover 19
brew install winetricks
brew tap gcenx/wine
brew cask install --no-quarantine wine-crossover
winetricks --force vcrun2010 vcrun2012 vcrun2013 vcrun2015 vcrun2017 dotnet452

# Download binaries
curl -o $HOME/.wine32/drive_c/FFXIFullSetup_US.part1.exe -k https://gdl.square-enix.com/ffxi/download/us/FFXIFullSetup_US.part1.exe
curl -o $HOME/.wine32/drive_c/FFXIFullSetup_US.part2.rar -k https://gdl.square-enix.com/ffxi/download/us/FFXIFullSetup_US.part2.rar
curl -o $HOME/.wine32/drive_c/FFXIFullSetup_US.part3.rar -k https://gdl.square-enix.com/ffxi/download/us/FFXIFullSetup_US.part3.rar
curl -o $HOME/.wine32/drive_c/FFXIFullSetup_US.part4.rar -k https://gdl.square-enix.com/ffxi/download/us/FFXIFullSetup_US.part4.rar
curl -o $HOME/.wine32/drive_c/FFXIFullSetup_US.part5.rar -k https://gdl.square-enix.com/ffxi/download/us/FFXIFullSetup_US.part5.rar
curl -o $HOME/.wine32/drive_c/Ashita.exe -k http://git.ashita.atom0s.com/Ashita/Ashitav3-Launcher/raw/master/Ashita.exe
