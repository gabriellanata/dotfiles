function simctl() {
  xcrun simctl $@
}

function clean_pile() {
 rm -rf ~/.cache/git-pile
 git worktree prune
}

# Open the PR for the current branch or the one passed as argument
function opr() {
  pull_request_number=$1
  if [[ -n $pull_request_number ]]; then
    BROWSER=open gh pr view $pull_request_number --web
    exit 0
  fi

  branch_name=$(git branch --show-current)
  if [[ $branch_name == "master" || $branch_name == "main" ]]; then
    echo "Opening the last PR created by you"
    pull_request_number=$(gh pr list --state open --author marcosgriselli --json number | jq '.[0].number')
    BROWSER=open gh pr view $pull_request_number --web
    exit 0
  fi

  BROWSER=open gh pr view --web
}