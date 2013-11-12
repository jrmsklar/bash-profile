c_reset=`tput setaf 3`
c_git_clean=`tput setaf 2`
c_git_dirty=`tput setaf 1`

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo " $c_git_dirty"
}

function parse_git_branch_name {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1] /"	
}

function parse_git_branch {
	echo $(parse_git_dirty)$(parse_git_branch_name)
}

alias gpush="git push origin master"
alias cdd="cd ~/Detroit\ Labs"
alias gs="git status -s"
alias gb="git branch"
alias gch="git checkout"
alias gpu="git pull upstream master"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias o="open ." #opens the current in Finder

export PATH="$HOME/.rbenv/bin:$HOME/bin:$PATH"
eval "$(rbenv init -)"

#configure the PS1
export PS1="\e[0;36m\u: \W \e[m\e[0;33m\$( parse_git_branch)\e[m$ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
