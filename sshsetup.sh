#!/bin/zsh

# Configuration
cat <<'EOF' > $HOME/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
EOF

# Generate new key
ssh-keygen -f ~/.ssh/id_rsaa -t rsa -b 4096 -C "slassenpm@gmail.com"
eval "$(ssh-agent -s)"

# Add key to keychain and ssh agent
ssh-add -AK ~/.ssh/id_rsa

# Copy key to clipboard
pbcopy < ~/.ssh/id_rsa.pub
echo New SSH key copied to clipboard. Paste in GitHub.
