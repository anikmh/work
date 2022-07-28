# Add SSH key when necessary
alias ssha='eval `ssh-agent -s` ssh-add ~/.ssh/id_rsa'

# Launch VPN PulseSecure
alias ocp='sudo openconnect-pulse-gui access.utk.edu'

# VPN commands for ExpressVPN
alias xv='expressvpn'
alias xvls='expressvpn list all'
alias xvst='expressvpn status'
alias xvcn='expressvpn connect'
alias xvdc='expressvpn disconnect'
alias xvdc='expressvpn refresh'
alias xvpf='expressvpn preferences'

# Activate/deactivate Anaconda virtual environment
alias nv0='conda deactivate'
alias bnv='conda activate base'
alias tfc='conda activate tf-cpu'
alias tfg='conda activate tf-gpu'

# Launch Jupyter packages in a Conda environment
alias jn='jupyter-notebook'
alias jl='jupyter-lab'

# APT autoclean/update/upgrade/autoremove
alias refresh='sudo apt autoclean &&sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt update'
