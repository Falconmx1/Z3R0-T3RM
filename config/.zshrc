# Z3R0-T3RM - Configuración Root Style Kali

# Cargar Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins de pentesting
plugins=(
  git
  sudo
  web-search
  zsh-syntax-highlighting
  zsh-autosuggestions
  fast-syntax-highlighting
  you-should-use
  command-not-found
)

source $ZSH/oh-my-zsh.sh

# Cargar aliases personalizados
source ~/.aliases.zsh 2>/dev/null

# ============================================
# 🎯 BANNER ASCII al inicio (solo para root)
# ============================================
if [[ $EUID -eq 0 ]]; then
    clear
    figlet "Z3R0-T3RM" | lolcat
    echo -e "\e[31m═══════════════════════════════════════════════════════════\e[0m"
    echo -e "\e[32m🔥 Root Terminal v1.0 | Kali Style | Modo Ofensivo\e[0m"
    echo -e "\e[31m═══════════════════════════════════════════════════════════\e[0m"
    echo ""
fi

# ============================================
# 🎨 PROMPT estilo Kali Linux (└─[#] rojo)
# ============================================
setopt PROMPT_SUBST
autoload -Uz vcs_info
precmd() { vcs_info }

# Prompt personalizado tipo Kali
PROMPT='%F{red}┌─[%F{green}%n@%F{cyan}%m%F{white}:%~%F{red}]
└─[%F{yellow}%#%F{red}]▶ %f'

# Prompt para comandos largos (segunda línea)
RPROMPT='%F{cyan}[%*]%f'

# ============================================
# 🛠️ Variables de entorno para pentesting
# ============================================
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=9000

# Alias adicional para root visual
alias root-prompt='export PROMPT="%F{red}┌─[%F{green}root@%F{cyan}Z3R0%F{white}:%~%F{red}]\n└─[%F{yellow}#%F{red}]▶ %f"'
