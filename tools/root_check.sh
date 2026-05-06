#!/bin/bash
if [ "$EUID" -ne 0 ]; then 
    echo "🔴 No root. Ejecutando sudo..."
    exec sudo "$0"
else
    echo "🟢 Root activado. Terminal Z3R0 cargada."
    zsh
fi
