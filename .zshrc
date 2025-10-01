# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.poshthemes/catppuccin-custom.omp.json)"

alias runpgs="~/.scripts/run-postgres.zsh"
alias nvc="nvim ~/.config/nvim"
alias dndchar="glow ~/.config/dndgo/character.md"
alias sleep="pmset displaysleepnow"

gonav() {
   local dir=$(command gonav)
   if [ ! -d "$dir" ]; then
       echo "gonav: not a valid directory: $dir" >&2
       return 1
   fi
   
   cd "$dir"
}

gonavt() {
     echo $(go run main.go)
}

export PATH=$PATH:$(go env GOPATH)/bin

