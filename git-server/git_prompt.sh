#colors
txtblk='\e[0;30m' # Black
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

#git current branch name
function find_git_branch {
   local dir=. head
   until [ "$dir" -ef / ]; do
      if [ -f "$dir/.git/HEAD" ]; then
         head=$(< "$dir/.git/HEAD")
         if [[ $head == ref:\ refs/heads/* ]]; then
            git_branch=" (${head#*/*/})"
         elif [[ $head != '' ]]; then
            git_branch=' (no_branch)'
         else
            git_branch=' (unknown)'
         fi
         return
      fi
      dir="../$dir"
   done
   git_branch=''
}

#git current status , it was very slow when the repo is large, so cancel.
function find_git_dirty {
    st=$(git status 2>/dev/null | tail -n 1)
    if [[ $st == "" ]]; then
        git_dirty=''
    elif [[ $st =~ "nothing to commit" ]]; then
        git_dirty=''
    else
        git_dirty='*'
    fi
}
#PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
#export PS1="\u@\h \w\[$txtcyn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "
export PS1="\[$txtgrn\]\u@\h\[$txtrst\]:\[$txtylw\]\w\[$txtcyn\]\$git_branch\[$txtrst\]\$ "

#Optionally, if you want a nice pretty prompt when using `sudo -s`, also add this line:
#export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
