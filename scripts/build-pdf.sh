#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

if ! command -v latexmk >/dev/null 2>&1; then
    cat >&2 <<'EOF'
latexmk non è disponibile.
Su macOS: installa MacTeX senza GUI con `brew install --cask mactex-no-gui`,
poi apri un nuovo terminale e riprova con `make pdf`.
In alternativa, avvia Docker Desktop e usa `make pdf-docker`.
EOF
    exit 127
fi

mkdir -p "$repo_dir/build/.latex"
(cd "$repo_dir/src" && latexmk -pdf -interaction=nonstopmode -halt-on-error \
    -file-line-error -outdir=../build/.latex main.tex)
cp "$repo_dir/build/.latex/main.pdf" "$repo_dir/build/phy.pdf"
printf 'PDF pronto: %s\n' "$repo_dir/build/phy.pdf"
