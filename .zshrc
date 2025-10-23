# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Greeting

# Prompt
PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"
# Export PATH$
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH


function hex-encode()
{
  echo "$@" | xxd -p
}

function hex-decode()
{
  echo "$@" | xxd -p -r
}

function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

# Setear el TABLE
function ostia()
{
	tarip=$1
	tarname=$2
	mimeip=$(echo -n "$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')")

	echo "$tarip $tarname" > /home/ilmater/.config/bin/.target
	sudo sed -i "s/^[^ ]* *eltuyo$/$tarip eltuyo/" /etc/hosts
	sudo sed -i "s/^[^ ]* *elmio$/$mimeip elmio/" /etc/hosts
	mkdir /home/ilmater/Documents/temp/$tarname
	sudo /home/ilmater/Documents/scripts/safe.sh $tarip
	cd /home/ilmater/Documents/temp/$tarname
	sudo nmap -sS -Pn -n --min-rate 5000 -vvv -p- -T5 --open -oN scan $tarip
}

# Limpiar el TABLE
function tio()
{
	echo '' > /home/ilmater/.config/bin/.target
	sudo sed -i "s/^[^ ]* *eltuyo$/0.0.0.0 eltuyo/" /etc/hosts
	sudo sed -i "s/^[^ ]* *elmio$/0.0.0.0 elmio/" /etc/hosts
	sudo /home/ilmater/Documents/scripts/iptablereset.sh
	ssh-keygen -f "/home/ilmater/.ssh/known_hosts" -R "eltuyo"
}

# Extract nmap information
function sacacaca(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
}

# alias
#alias ls='ls -lh --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# custom aliases
alias cat='batcat'
alias cato='batcat --no-paging'
alias gato='/bin/cat'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias ..='cd ..'

# real machine state dickenson aliases
alias wasamandrapa='sudo openvpn /home/ilmater/Documents/vpn/ChebraHTB.ovpn'
alias lawasa='sudo openvpn /home/ilmater/Documents/vpn/ChebraTHM.ovpn'
alias besonegro='sudo /home/ilmater/Documents/scripts/safe.sh'
alias ssh2john='python /usr/share/john/ssh2john.py'
alias scan='sudo nmap -sT -Pn -n --min-rate 5000 -vvv -p- -T5 --open -oN scan '
alias scandalo='sudo nmap -A -Pn -n --min-rate 5000 -vvv --open -oN scanALL -p'
alias home='cd /home/ilmater/Documents'
alias binarios='cd /home/ilmater/Documents/tools/binaries'
alias tool='cd /home/ilmater/Documents/tools/'
alias machine='cd /home/ilmater/Documents/temp/'
alias rbd='sudo /home/ilmater/Documents/scripts/iptablereset.sh'
alias joomscan='perl /home/ilmater/opt/joomscan/joomscan.pl'
alias magescan='php /home/ilmater/opt/magescan/magescan.phar'
alias tomactm='gato /home/ilmater/Documents/tools/banner/KingCh'

#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#if [ -f /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]; then
#  source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  # Select all suggestion instead of top on result only
#  zstyle ':autocomplete:tab:*' insert-unambiguous yes
#  zstyle ':autocomplete:tab:*' widget-style menu-select
#  zstyle ':autocomplete:*' min-input 2
#  bindkey $key[Up] up-line-or-history
#  bindkey $key[Down] down-line-or-history
#fi

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#setopt appendhistory
setopt histignorealldups sharehistory

# Useful alias for benchmarking programs
# require install package "time" sudo apt install time
# alias time="/usr/bin/time -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"
# Display last command interminal
echo -en "\e]2;Parrot Terminal\a"
preexec () { print -Pn "\e]0;$1 - Parrot Terminal\a" }
source /opt/powerlevel10k/powerlevel10k.zsh-theme

# BindKeys para Inicio, Fin, Supr, Backspace
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Pyenv configuration
export PYENV_ROOT="$HOME/opt/pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

