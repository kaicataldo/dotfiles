# tmux
tmn() {
  BASE=$(basename $PWD)
  tmux new -s $BASE
}
