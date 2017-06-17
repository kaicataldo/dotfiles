# zsh config location
export "CONFIG_DIR=$HOME/.zsh"

# Custom functions path
fpath=($CONFIG_DIR/functions $fpath)

# Source all zsh files
source "$CONFIG_DIR/config.zsh"
source "$CONFIG_DIR/initialize.zsh"
source "$CONFIG_DIR/completion.zsh"
source "$CONFIG_DIR/functions.zsh"
source "$CONFIG_DIR/aliases.zsh"

# Source local config file specific to machine if it exists
if [[ -a "$HOME/.localrc" ]]; then
  source "$HOME/.localrc"
fi
