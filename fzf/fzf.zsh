# fzf_cd() {
#   local base_dir="${1:-.}"  # Default to the current directory if no argument is provided
#   local dir
#
#   # Find directories in base_dir, excluding .git, node_modules, venv, and env folders
#   # dir=$(find "$base_dir" -type d \( -name .git -o -name node_modules -o -name venv -o -name env \) -prune -false -o -type d | fzf) && cd "$dir"
#   dir=$(find "$base_dir" -type d | fzf) && cd "$dir"
# }

# Alias for easy usage
alias fcd="fzf_cd"


# fzf_cd() {
#     local base_dir="${1:-$HOME}"
#     local dir
#     
#     # Select directory using fzf
#     # dir=$(find "$base_dir" -type d | fzf)
#     dir=$(find "$base_dir" \
#         -type d \( \
#             -name ".git" -o \
#             -name "node_modules" \
#         \) -prune -o \
#         -type d -print | fzf)
#     
#     if [ -n "$dir" ]; then
#         # Get the basename of the directory for session name
#         local session_name=$(basename "$dir")
#         
#         # Check if we're already in a tmux session
#         if [ -z "$TMUX" ]; then
#             # Check if session exists
#             if tmux has-session -t "$session_name" 2>/dev/null; then
#                 # Session exists, attach to it
#                 tmux attach -t "$session_name"
#             else
#                 # Create new session and attach
#                 tmux new-session -d -s "$session_name" -c "$dir"
#                 tmux attach -t "$session_name"
#             fi
#         else
#             # Already in tmux, switch to session if exists or create new
#             if tmux has-session -t "$session_name" 2>/dev/null; then
#                 tmux switch-client -t "$session_name"
#             else
#                 tmux new-session -d -s "$session_name" -c "$dir"
#                 tmux switch-client -t "$session_name"
#             fi
#         fi
#     fi
# }
#
fzf_cd() {
    local dir
    
    # Combine both directories for search, but show relative paths
    dir=$(find "$HOME" "/media/bappa/DATA/projects" \
        -type d \( \
            -name ".git" -o \
            -name "node_modules" \
            -name "venv" \
            -name "env" \
        \) -prune -o \
        -type d -print | \
        sed "s|$HOME|~|" | \
        # fzf --preview 'ls -la {}' \
        fzf --preview 'eval ls -la $(echo {} | sed "s|~|$HOME|")' \
        --preview-window right:50% | \
        sed "s|~|$HOME|")
    
    if [ -n "$dir" ]; then
        # Get the basename of the directory for session name
        local session_name=$(basename "$dir")
        
        # Check if we're already in a tmux session
        if [ -z "$TMUX" ]; then
            # Check if session exists
            if tmux has-session -t "$session_name" 2>/dev/null; then
                # Session exists, attach to it
                tmux attach -t "$session_name"
            else
                # Create new session and attach
                tmux new-session -d -s "$session_name" -c "$dir"
                tmux attach -t "$session_name"
            fi
        else
            # Already in tmux, switch to session if exists or create new
            if tmux has-session -t "$session_name" 2>/dev/null; then
                tmux switch-client -t "$session_name"
            else
                tmux new-session -d -s "$session_name" -c "$dir"
                tmux switch-client -t "$session_name"
            fi
        fi
    fi
}
