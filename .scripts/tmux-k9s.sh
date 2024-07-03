#!/bin/bash

session_name="tmux-scratch"
abduco | grep -q "$session_name" || abduco -n $session_name k9s
ps aux | grep abduco | grep -- "-a $session_name" | awk '{print $2}' | xargs kill
tmux split-window -v -l 50% "abduco -a $session_name"
sleep 1
tmux resize-pane -U
tmux resize-pane -D
