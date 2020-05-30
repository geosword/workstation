# TODO
need to think about hows best to split functionality. E.g. if we install ansible, should that (for example) include ansible linting in vim? e.g. modify vims config?
I feel not because that will be taking the config away from what the role has configured. Therefore adding functionality might involve modifying more than one role?
But the point of roles is to be generic and have its output affected by variables, so inactually, Its the variables that would change, and that would (presumably) be
in one big phat file? - at least the values that override defaults anwyays. Stick to roles that only modify things within thier sphere of operation. e.g. vim ALREADY has
config in for ansible linting, even if ansible-dev-role is not installed.
#still needed
- virtualbox
- plasma - install and configure - prereq is the nvidia role
- misc-packages - for installing shitty things like ipcalc, hwinfo and various other little packages that require no configuration apart from actuall installation
- terraform
- ansible
- virtualenv wrapper?
- user role - to create your user and all the standard folders you want, allow passwordless sudo - ssh config
- kubectl role - the alias to k will already be in the zsh role (as per above discussion)
- bluetooth
- cupsd
- sublime (hopefully can install this via the AUR)
- yay - to install things via AUR easier
- nvidia
- google chrome
- zsh - but with powerlevel 10k (AUR again?) - or is this installed via antigen?
- helm (2 and 3)
- drone ci cli
- informant (for upgrades)
- kernel-module-hook - this might belong in a general (Arch role which might include the locale for example)
- puppet-lint - probably just add to "misc" role
- fswatch - for triggering things off file system events (e.g. builds)
- configure cron with backup scripts (home and root)
- iptables
- docker (geerlingguy)
- git + git config
- .tools folder (user role I think)
- switchto (user role too)
- tmux split (user role)
- tmux + tmux config
