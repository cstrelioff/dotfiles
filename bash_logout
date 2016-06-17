##
## Christopher C. Strelioff
## 2016 MIT LICENSE
##
## 2016, June: Ubuntu 14.04LTS
##

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
