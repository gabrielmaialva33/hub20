#!/bin/bash
# Hub 2.0 - Build para macOS
# Build script para macOS

set -e

echo "🏢 Hub 2.0 - Auto Booking Build"
echo "================================"

# Instala Rust se nao tiver
if ! command -v cargo &> /dev/null; then
    echo "📦 Instalando Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

echo "🔨 Compilando..."
cargo build --release

BINARY="target/release/hub20"
echo ""
echo "✅ Build completo!"
echo "📍 Binario: $(pwd)/$BINARY"
echo "📏 Tamanho: $(du -h $BINARY | cut -f1)"
echo ""
echo "Para usar:"
echo "  cp $BINARY /usr/local/bin/hub20"
echo "  hub20              # menu interativo"
echo "  hub20 listar       # ver espacos"
echo "  hub20 espiao 2026-03-27  # quem reservou"
echo "  hub20 sniper --area 17 --data 2026-04-03 --hora 20:00"
echo ""
echo "Crie um accounts.json no mesmo diretorio do binario:"
echo '  [{"label":"Principal","cpf":"000.000.000-00","senha":"xxx","condominio":0000,"unidade":"0 000"}]'
