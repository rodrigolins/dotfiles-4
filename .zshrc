# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
#source /usr/local/bin/virtualenvwrapper.sh

# Make python 3 the default
#alias python="python3"

#FZF configs
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_DEFAULT_COMMAND='nvim $(fzf)'

# Path to your oh-my-zsh installation.
export ZSH=/Users/teddy.kim/.oh-my-zsh

#JAVA STUFF
export JAVA_HOME=/Users/teddy.kim/.sdkman/candidates/java/current
# Need this because pip can't compile pygraphviz without being pointed to graphviz
#export CFLAGS="-I/usr/local/include -L/usr/local/lib"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13


# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# intellij home
export  INTELLIJ_HOME="/Applications/IntelliJ IDEA.app/Contents"  

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/Library/android/sdk/tools:$HOME/.rvm/bin:$INTELLIJ_HOME/bin"

# android home
export ANDROID_HOME="/Users/teddy.kim/Library/Android/sdk/tools"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/teddy.kim/.sdkman"

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
[[ -s "/Users/teddy.kim/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/teddy.kim/.sdkman/bin/sdkman-init.sh"


# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

alias tnc=/Users/teddy.kim/projects/nginx-config/test-nginx-config.sh

export PATH="$HOME/.fastlane/bin:$PATH"

