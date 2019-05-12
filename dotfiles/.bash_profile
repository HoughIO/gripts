export CLICOLOR=true
export LSCOLORS=exfxcxdxbxegedabagacad
export SLACK_CLI_TOKEN='TOKEN'
alias ll="ls -al"
alias vi="mvim -v"
alias vim="mvim -v"
alias tma="tmux attach"
alias glog="git log --graph --oneline --all"
alias recordsvg="termtosvg -g 24x24 -t progress_bar"
alias record="asciinema rec"
alias gc="git checkout"
alias ga="git add"
alias gb="git branch"
alias gd="git diff"
alias rmallimages='docker rmi $(docker images -q)'
alias rmallcontainers='docker rm $(docker ps -a -q)'
alias spin="spinner"
alias lsjq='ls -A | jq -R "[.]" | jq -s "add"'
alias dependencies="find . -maxdepth 2 -type f -name package.json -exec jq -r '.dependencies | to_entries[] | .key' {} \; | sort | uniq -c | sort -n | tail -r"
alias lastmerge='if [ $(git cat-file -p $(git rev-parse HEAD) | grep parent | wc -l) = 1 ]; then echo "Last commit is not a Merge."; else echo "Last commit is a Merge."; fi'
alias ip='curl ip.properties | jq -r ".ip"'
alias ipsh='curl ip.properties | jq -r ".ip | @sh"'

upper () {
  local file=$1
  local fileUpper=$(echo "${file}" | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1')

  git mv ${file} ${fileUpper}
}

source ~/.git-completion.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PATH="/Users/GormWho/.gem/ruby/2.0.0/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PS1="\[\e[31m\]\u\[\e[m\]\[\e[33;40m\]@\[\e[m\]\[\e[33m\]\W\[\e[m\]\[\e[36m\]\`parse_git_branch\`\[\e[m\] "
export PATH=/Users/GormWho/Knotel/mono/tools/knot/bin2:/Users/GormWho/Library/Python/3.7/bin:/Users/GormWho/.nvm/versions/node/v10.15.1/bin:/Users/GormWho/Knotel/mono/tools/knot/bin2:/Users/GormWho/Library/Python/3.7/bin:/Users/GormWho/.nvm/versions/node/v10.15.1/bin:/Users/GormWho/Knotel/mono/tools/knot/bin2:/Users/GormWho/Library/Python/3.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/GormWho/Knotel/mono/tools/knot/bin2:/Users/GormWho/Library/Python/3.7/bin:/Users/GormWho/.nvm/versions/node/v10.15.1/bin:/Users/GormWho/Personal/gripts/readme:/Users/GormWho/Personal/gripts/spinner:/users/GormWho/Personal/gripts/slack-cli/src:/users/GormWho/bin:/Users/GormWho/Personal/gripts/.yadm-project
