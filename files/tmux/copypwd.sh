#!/bin/env bash
CURRENTDIR=$(tmux last-pane; tmux display-message -p -F "#{pane_current_path}")
tmux last-pane; tmux send-keys "cd ${CURRENTDIR}" Enter
