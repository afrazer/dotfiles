
# alias ll="eza -alF --group-directories-first"
# alias ls="eza"

# Git bash aliases
alias ga="git add"
alias gc="git commit --verbose"
alias gcm="git commit --message"

alias gs="git status"
alias gss="git status --short --branch"

alias gd="git diff"
alias gdw="git diff --word-diff"
alias gds="git diff --staged"
alias gdsw="git diff --staged --word-diff"

alias gl="git lg"
alias gls="git lg --stat"
alias gg="git graph --all"

alias grcd="cd $(git root)"

alias gdm="git difftool -y --tool meld"
alias gdn="git difftool -y --tool nvimdiff"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias shrug="echo -n '¯\_(ツ)_/¯'"

# Resource environment
alias src="source ~/.bashrc"

alias vimr="vim -R"

# Miscellaneous
alias tree="tree -Ch"
alias rm="rm -i"
# alias cp="cp -i"
alias mv="mv -i"
alias h="history"
alias j="jobs -l"
alias wget="wget -c"
alias which="which -a"
alias less="less -r -x4 -W"
alias diff="colordiff --side-by-side --suppress-common-lines"

alias julia-dev="/opt/julia/julia-0.6.0/julia"

