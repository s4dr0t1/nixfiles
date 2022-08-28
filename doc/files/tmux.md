## Basics

### Sessions 

Shortcut | Name
-|-
`tmux` | Start a new tmux session
`tmux new -s <identifier>` | Start a new tmux session with the specific identifier
`prefix + $` | Rename the current session
`tmux detach` or `prefix + d` | Detach the current session
`tmux ls` | Show all active sessions
`tmux attach -t <identifier>` | Attach to a specific session
`tmux kill-session -t <identifier>` | Kill a specific session
`tmux kill-server` | Kill the entire tmux server
`prefix + s` | Show all active sessions

## Panes
Shortcut | Description
-|-
`prefix + h` | Create a horizontal split
`prefix + v` | Create a vertical split
`prefix + q` | Show all the panes in the current window
`prefix + z` | Toggle zooming the current pane
`prefix + h/l/j/k` | Navigate between panes
`prefix + {` | Swap the current pane with the previous pane
`prefix + }` | Swap the current pane with the next pane
`prefix + x` | Kill the current pane

## Windows

Shortcut | Description
-|-
`prefix + c` | Create a new window
`prefix + <windowsNumber>` | Move to the windows specified by `windowsNumber`
`prefix + p/ n` | Move to the next/ previous window
`prefix + !` | Move the current pane into a new window
`prefix + ,` | Rename the current window
`prefix + w` | Show all windows within a session
`prefix + &` | Kill the current window

## Miscellaneous
Shortcut | Description
-|-
`prefix + [` | Go to scrolling mode
