#!/bin/bash
# Z3R0-T3RM Linux Installer - Con Oh-My-Zsh + Plugins

echo "[+] Verificando root..."
if [[ $EUID -ne 0 ]]; then
   echo "❌ Ejecuta con: sudo ./installer.sh"
   exit 1
fi

echo "[+] Instalando dependencias..."
apt update && apt install -y zsh git curl wget fonts-powerline figlet lolcat

echo "[+] Instalando Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "[+] Instalando Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "[+] Instalando plugins de pentesting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

echo "[+] Copiando configs personalizadas..."
cp config/.zshrc /root/.zshrc
cp config/.p10k.zsh /root/.p10k.zsh 2>/dev/null
cp config/aliases.zsh /root/.aliases.zsh

echo "[+] Configurando ZSH por defecto para root..."
chsh -s $(which zsh) root

echo "[✅] Instalación completa. Ejecuta: zsh"
