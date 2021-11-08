# for https://github.com/aykamko/tag
# uses "ag" as the alias, but it's ripgrep underneath

export TAG_CMD_FORMAT_STRING="nvim -c 'call cursor({{.LineNumber}}, {{.ColumnNumber}})' '{{.Filename}}'"

if (( $+commands[tag] )); then
  export TAG_SEARCH_PROG=rg  # replace with rg for ripgrep
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag=tag  # replace with rg for ripgrep
fi

