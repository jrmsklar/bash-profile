c_reset=`tput setaf 3`
c_git_clean=`tput setaf 2`
c_git_dirty=`tput setaf 1`

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo " $c_git_dirty***${c_reset}"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}