#!/usr/bin/env bash
set -e
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
if ! command -v uvx >/dev/null 2>&1; then
    echo "Installing uv package runner..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi
uvx --from https://github.com/jurisatlas/cli/archive/refs/heads/main.zip jurisatlas < /dev/tty
