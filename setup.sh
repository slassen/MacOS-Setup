#!/bin/zsh

echo "Installing Xcode CLI..."
xcode-select --install

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing nvm..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh)"

echo "Installing services..."
brew install postgresql cask cmake p7zip
brew services start postgresql

echo "Installing applications..."
brew cask install tableplus iterm2 vlc visual-studio-code lastpass expressvpn qbittorrent zoom postman

echo "Creating ~/.zshrc..."
cat <<'EOF' > $HOME/.zshrc
plugins=(git brew)

alias publish="dotnet publish /p:NativeCodeGen=cpp -c Release -r osx-x64"
alias dt="cd $HOME/Desktop"
alias op() {
    printf 'Select a project name:\n'; ls $HOME/Code
    printf '> '; read dir

    if [ "$1" = "c" ]; then
        code .
    elif [ "$1" = "g" ]; then
        cd $HOME/Code/$dir && git status
    else
        cd $HOME/Code/$dir && ls -a
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
EOF
source $HOME/.zshrc

echo "Installing Node LTS"
nvm install --lts
npm install -g nodemon eslint

echo "Updating settings..."
# User settings for Visual Studio Code
cat <<'EOF' > $HOME/Library/Application\ Support/Code/User/settings.json
{
    "workbench.startupEditor": "newUntitledFile",
    "terminal.integrated.shell.osx": "/bin/zsh",
    "editor.renderControlCharacters": true,
    "editor.renderWhitespace": "all",
    "editor.minimap.enabled": false,
    "breadcrumbs.enabled": true,
    "diffEditor.ignoreTrimWhitespace": false,
    "window.zoomLevel": 0,
    "editor.tabSize": 2
}
EOF

echo "Downloading Wireless Mouse Driver..."
curl --show-error -L https://download01.logi.com/web/ftp/pub/techsupport/keyboards/FirmwareUpdateToolInstaller.zip | tar -xf - 
unzip ./FirmwareUpdateTool/FirmwareUpdateTool.zip && mv FirmwareUpdateTool.app $HOME/Downloads/Wireless\ Mouse\ Setup.app && rm -rf FirmwareUpdateTool

echo "Finishing miscellaneous tasks..."
code --install-extension wix.vscode-import-cost
code --install-extension 2gua.rainbow-brackets
code --install-extension dbaeumer.vscode-eslint
code --install-extension formulahendry.auto-close-tag
mkdir $HOME/Code
