# Add SSH key (used only if/when necessary)
alias ssha='eval `ssh-agent -s` ssh-add ~/.ssh/id_rsa'

# Launch o2graph
alias o2='o2graph'

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
alias nvo='conda deactivate'
alias bnv='conda activate base'
alias tnv='conda activate tf-gpu'

# Launch Jupyter packages in a Conda environment
alias jn='jupyter-notebook'
alias jl='jupyter-lab'

# Aptitude commands
alias apd='aptitude'
alias arm='sudo aptitude -o Aptitude::Delete-Unused=1 install'
alias refresh='sudo aptitude autoclean && \
	       sudo aptitude update && \
	       sudo aptitude safe-upgrade -y && \
	       sudo aptitude update'
