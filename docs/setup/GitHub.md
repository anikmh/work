## Prerequisites 
- `git` 
- [[SSH]] keys
___
## Installation
`sudo apt install git` 
___
## Setup  
- Add SSH public key to github account
- Configure git to create aliases or copy the gitconfig file to `~/.gitconfig` 
  `git config --global user.name "Anik Hasan"` 
  `git config --global user.email anik@vols.utk.edu` 
  `git config --global alias.co checkout` 
  `git config --global alias.br branch` 
  `git config --global alias.ci commit` 
  `git config --global alias.st status` 
  `git config --global alias.df diff` 
  `git config --global alias.dfs 'diff --staged'` 
  `git config --global pull.rebase false` 