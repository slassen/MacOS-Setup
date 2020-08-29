#!/bin/zsh

echo "Installing Xcode CLI..."
xcode-select --install

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing nvm..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh)"

echo "Installing services..."
brew install mysql postgresql cask cmake p7zip
brew services start mysql
brew services start postgresql

echo "Installing applications..."
brew cask install tableplus google-chrome iterm2 vlc visual-studio-code lastpass discord expressvpn qbittorrent skype visual-studio dotnet-sdk

echo "Creating ~/.zshrc..."
cat <<'EOF' > $HOME/.zshrc
plugins=(git brew)

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
npm install -g nodemon

echo "Updating settings..."
# Sleep display after 1 hour
sudo pmset -a displaysleep 60
# User settings for Visual Studio Code
cat <<'EOF' > $HOME/Library/Application\ Support/Code/User/settings.json
{
    "workbench.startupEditor": "newUntitledFile",
    "terminal.integrated.shell.osx": "/bin/zsh",
    "editor.renderControlCharacters": true,
    "editor.renderWhitespace": "all",
    "editor.minimap.enabled": false
}
EOF

echo "Finishing miscellaneous tasks..."
mkdir $HOME/Code
