# Add SSH key (used only if/when necessary)
alias ssha='eval `ssh-agent -s` ssh-add ~/.ssh/id_rsa'

# Launch VPN PulseSecure
alias ocp='sudo openconnect-pulse-gui access.utk.edu'

# ExpressVPN commands 
alias xv='expressvpn'
alias xvls='expressvpn list'
alias xvla='expressvpn list all'
alias xvst='expressvpn status'
alias xvcn='expressvpn connect'
alias xvcs='expressvpn connect smart'
alias xvdc='expressvpn disconnect'
alias xvrf='expressvpn refresh'
alias xvpf='expressvpn preferences'
alias xvdg='expressvpn diagnostics'

# Activate/deactivate Anaconda virtual environment
alias nv0='conda deactivate'
alias bnv='conda activate base'
alias tfg='conda activate tf-gpu'

# Launch Jupyter packages in a Conda environment
alias jn='jupyter-notebook'
alias jl='jupyter-lab'

# Aptitude (package manager)
alias apd='aptitude'

# APT autoclean/update/upgrade/autoremove
alias refresh='sudo aptitude autoclean && sudo aptitude update && \
    sudo aptitude safe-upgrade -y && sudo aptitude update'
