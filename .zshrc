ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# Použití aliasů
# alias [custom-command-alias]="[command]"
alias vpn-start="openvpn3 session-start --config SessionName && /opt/check_vpn.sh"
alias vpn-stop="openvpn3 session-manage --config SessionName --disconnect"
alias vpn-list="openvpn3 sessions-list"
alias vpn-restart="vpn-stop && vpn-start"
alias screwjava="killall java"
alias fuckjava="killall -9 java"

kdoblokujeport() {
    if [ -z "$1" ]; then
        echo "Napiš ještě port, který tě zajímá."
    else
        sudo netstat -tulnp | grep "$1";
        echo "Vyber PID a killni ho. Nebo nech žít třeba. Jak chceš."
    fi
}
