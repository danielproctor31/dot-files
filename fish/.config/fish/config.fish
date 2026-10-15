# --------------------------------------------------
# PATH
# --------------------------------------------------

fish_add_path --global --prepend "$HOME/.local/bin"
fish_add_path --global --prepend /usr/local/bin

# --------------------------------------------------
# Homebrew (macOS + Linux)
# --------------------------------------------------

if test (uname) = Darwin
    # Apple Silicon, then Intel Mac
    if test -x /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    else if test -x /usr/local/bin/brew
        eval (/usr/local/bin/brew shellenv)
    end
else
    # Linuxbrew
    if test -x /home/linuxbrew/.linuxbrew/bin/brew
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    end
end

if test -x "$brew_bin"
    eval ($brew_bin shellenv fish)
end

# --------------------------------------------------
# fnm (must come after Homebrew so fnm is on PATH)
# --------------------------------------------------

if type -q fnm
    fnm env --use-on-cd --shell fish | source
end

# --------------------------------------------------
# .NET
# --------------------------------------------------

set -gx DOTNET_ROOT "$HOME/.dotnet"
fish_add_path --global "$DOTNET_ROOT"
fish_add_path --global "$DOTNET_ROOT/tools"

# --------------------------------------------------
# OpenCode
# --------------------------------------------------

fish_add_path --global "$HOME/.opencode/bin"

# --------------------------------------------------
# Starship prompt
# --------------------------------------------------

if status is-interactive; and command -q starship
    starship init fish | source
end