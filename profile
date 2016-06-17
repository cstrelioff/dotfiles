##
## Christopher C. Strelioff
## 2016 MIT LICENSE
##
## 2016, June: Ubuntu 14.04LTS
##   -- this is the default .profile file for Ubuntu 14.04
##   -- may need to move contents to .bash_profile or similar for other OS
##

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
