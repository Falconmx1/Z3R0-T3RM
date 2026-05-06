# Z3R0-T3RM Config
export ZSH="/root/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git kali sudo web-search)
source $ZSH/oh-my-zsh.sh
source ~/.aliases.zsh

# Prompt estilo Kali root
PROMPT='%F{red}┌─[%F{green}root@%F{cyan}Z3R0%F{white}:%~%F{red}]
└─[%F{yellow}#%F{red}]▶ '
