alias show-aliases="cat ~/.bash_profile | grep alias"

alias cdx="cd code directory"

alias fhere="find . -name"
alias there="egrep -rnw . --color -e"

alias ls="ls -al --color=auto"
alias http-server="python -m http.server 8000 --bind 127.0.0.1"

###########################################
### GIT

alias gci="git ci"
alias gco="git co"
alias gdiff="git diff"
alias gdt="git dt"
alias glg="git lg"
alias gmt="git mt"
alias gst="git status"

git-delete-closed-branches() {
  echo "Searching for closed branches..."
    git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

git-delete-orig-files() {
  echo "Searching for *.orig files..."
  find . -name '*.orig' -delete -print
}

git-reb() {
  echo "git rebase HEAD~$1"
  git rebase -i HEAD~$1
}

git-which-branch() {
    git branch --all | grep $1
}

git-make-tag() {
  git tag -a $1 -m "$1"
  git push origin $1
}

git-delete-tag() {
  git tag -d $1
  git push --delete origin $1
}

git-diffall() {
    git diff --name-only "$@" | while read filename; do
        echo "Diff $filename"
        git difftool "$@" --no-prompt "$filename" &
    done    
}

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi