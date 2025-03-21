
# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Sublime command line tools
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Color definitions using tput
c_reset=$(tput setaf 3)
c_git_clean=$(tput setaf 2)
c_git_dirty=$(tput setaf 1)

# Functions
parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo " $c_git_dirty"
}

parse_git_branch_name() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1] /"
}

parse_git_branch() {
  echo "$(parse_git_dirty)$(parse_git_branch_name)"
}

# Aliases
alias s="git status -s"
alias gb="git branch"
alias gch="git checkout"
alias gpu="git pull upstream master"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias o="open ." # opens current directory in Finder

# Configure the prompt (PS1 is not recommended in ZSH; use PROMPT instead)
autoload -Uz colors
colors

setopt PROMPT_SUBST
PROMPT='%F{cyan}%n: %1~ %f%F{yellow}$(parse_git_branch)%f$ '

# Bash completion compatibility if needed (less relevant in zsh)
if [[ -f "$(brew --prefix)/etc/bash_completion" ]]; then
  source "$(brew --prefix)/etc/bash_completion"
fi
