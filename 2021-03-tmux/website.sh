#!/bin/bash

# check if the session called exactly 'website' exist
if ! tmux has-session -t=website; then
  # if it does not exist
  # create a new session (new -s) called 'website' detached (-d flag)
  tmux new -s website -d

  # split the 0th pane in the 0th window of the 'website' vertically
  tmux split-window -v -t website:1.1 -p 70
  # tmux split-window -h -t website:1.2

  tmux send-keys -t website:1.1 'cd "/home/yury/PROJECTS/PERSONAL/zyrikby_webpage/website/"' C-m
  tmux send-keys -t website:1.1 'code content/' C-m
  tmux send-keys -t website:1.2 'cd "/home/yury/PROJECTS/PERSONAL/zyrikby_webpage/website/"' C-m
  tmux send-keys -t website:1.2 'hugo serve -e production -D -F' C-m
  # tmux send-keys -t website:1.3 'htop' C-m
fi

tmux a -t=website
