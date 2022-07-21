# Add SSH key when necessary
alias ssha='eval `ssh-agent -s` ssh-add ~/.ssh/id_rsa'

# Launch VPN OpenConnect
alias vpn='sudo openconnect-pulse-gui access.utk.edu'

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
