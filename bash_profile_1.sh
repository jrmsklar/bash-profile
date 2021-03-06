alias gpush="git push origin master"
alias cdd="cd ~/Detroit\ Labs"
alias gs="git status -s"
alias gb="git branch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PS1="\e[0;36m\h: \W $ \e[m"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi