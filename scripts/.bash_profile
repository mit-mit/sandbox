alias ll="ls -l"
alias pub="dart pub"
alias pubg="dart pub global"

export PATH="/Users/mit/dev/depot_tools:$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mit/dev/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mit/dev/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mit/dev/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mit/dev/google-cloud-sdk/completion.bash.inc'; fi
