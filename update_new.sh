#!/bin/zsh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS=$(uname -s)
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

backup_existing() {
    local source_dir="$1"
    local target_dir="$HOME"
    
    if [[ ! -d "$source_dir" ]]; then
        return
    fi
    
    find "$source_dir" -type f | while read -r file; do
        rel_path="${file#$source_dir/}"
        target_file="$target_dir/$rel_path"
        
        if [[ -f "$target_file" ]] && [[ ! -L "$target_file" ]]; then
            mkdir -p "$BACKUP_DIR/$(dirname "$rel_path")"
            mv "$target_file" "$BACKUP_DIR/$rel_path"
            log "Backed up $rel_path"
        fi
    done
}

install_dotfiles() {
    local source_dir="$1"
    local target_dir="$HOME"
    
    if [[ ! -d "$source_dir" ]]; then
        warn "Directory $source_dir not found, skipping..."
        return
    fi
    
    log "Installing dotfiles from $(basename "$source_dir")..."
    
    backup_existing "$source_dir"
    
    rsync -avh \
        --exclude='.git/' \
        --exclude='.DS_Store' \
        --exclude='README*' \
        --exclude='*.md' \
        "$source_dir/" "$target_dir/"
    
    log "Installed dotfiles from $(basename "$source_dir")"
}

function update_homebrew() {
    log "Update homebrew..."

	brew update
	brew upgrade
	brew cleanup
}

function update_pacman() {
    log "Update pacman/yay..."

	if command -v yay >/dev/null 2>&1; then
		yay -Syu
	else
		log "yay not installed. Using pacman."

		sudo pacman -Syu
	fi
}

case $OS in
    "Darwin")
        log "Detected macOS"
        install_dotfiles "$DOTFILES_DIR/shared"
        install_dotfiles "$DOTFILES_DIR/mac"
        
        if command -v brew >/dev/null 2>&1; then
			read "confirm?Homebrew detected, update homebrew? (y/n)"
			if [[ "$confirm" =~ ^[Yy]$ ]]
			then
				update_homebrew
			fi
        fi
        ;;
        
    "Linux")
        if [[ -f /etc/arch-release ]]; then
            log "Detected Arch Linux"
            install_dotfiles "$DOTFILES_DIR/shared"
            install_dotfiles "$DOTFILES_DIR/arch"
            
            log "You might want to install AUR packages and restart your WM"

			read "confirm?Update pacman? (y/n)"
			if [[ "$confirm" =~ ^[Yy]$ ]]
			then
				update_pacman
			fi
        else
            error "Linux distribution not supported yet"
            exit 1
        fi
        ;;
        
    *)
        error "Unsupported operating system: $OS"
        exit 1
        ;;
esac

find "$HOME/.config" -name "*.sh" -type f -exec chmod +x {} \; 2>/dev/null || true

log "Installation completed!"
if [[ -d "$BACKUP_DIR" ]]; then
    log "Backups saved to: $BACKUP_DIR"
fi

log "You might need to:"
echo "  - Restart your shell or run: source ~/.zshrc (macOS) / source ~/.bashrc (Arch)"
echo "  - Restart your terminal/WM"
echo "  - Check application-specific settings"
