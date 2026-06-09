# Make a directory and cd into it.
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Fuzzy checkout branch.
fbr() {
  local branches branch
  branches=$(git --no-pager branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" | fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Kill process on a given port.
killport() {
  local port="$1"
  if [ -z "$port" ]; then
    echo "usage: killport <port>"
    return 1
  fi
  local pid
  pid=$(lsof -ti tcp:"$port")
  if [ -z "$pid" ]; then
    echo "nothing listening on $port"
    return 0
  fi
  kill -9 "$pid" && echo "killed $pid"
}

# Extract just about anything.
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.tar.xz)    tar xJf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.zip)       unzip "$1"      ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "cannot extract '$1'" ;;
    esac
  else
    echo "'$1' is not a file"
  fi
}

