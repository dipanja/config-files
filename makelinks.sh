#!/bin/bash

SOURCE_DIR="$HOME/.config/dotfiles"
DEST_DIR="$HOME"

# Create symlink for kitty folder
ln -sfn "$SOURCE_DIR/kitty" "$DEST_DIR/.config/kitty"
echo "Symlink created for kitty folder."

# Create symlink for nvim folder
ln -sfn "$SOURCE_DIR/nvim" "$DEST_DIR/.config/nvim"
echo "Symlink created for nvim folder."

# Create symlink for ranger
ln -sfn "$SOURCE_DIR/ranger" "$DEST_DIR/.config/ranger"
echo "Symlink created for ranger."

# Create symlink for yazi
ln -sfn "$SOURCE_DIR/yazi" "$DEST_DIR/.config/yazi"
echo "Symlink created for yazi."

# Create symlink for .zshrc file
ln -sfn "$SOURCE_DIR/zsh/.zshrc" "$DEST_DIR/.zshrc"
echo "Symlink created for .zshrc file."

# Create symlink for .tmux.conf file
ln -sfn "$SOURCE_DIR/tmux/.tmux.conf" "$DEST_DIR/.tmux.conf"
echo "Symlink created for .tmux.conf file."

# Create symlink for .fzf.zsh file
ln -sfn "$SOURCE_DIR/fzf/fzf.zsh" "$DEST_DIR/.fzf.zsh"
echo "Symlink created for .fzf.zsh file."

echo "All symlinks have been created successfully."
