dotfiles
========

There are my dotfiles -- for backup and easy deployment to new machines. These
are **my preferences** for working with bash, tmux/screen and vim on Ubuntu
14.04. You are welcome to use or copy **at your own risk**.

deployment
----------

A **Python 3** deploy script is available for simple deployment of the
included dotfiles on a new machine.

**Note:** Do not blindly use this! Please carefully look at the files and make
backups before trying anything!

If you want to move forward, do:

```bash
$ cd ~
$ git clone https://github.com/cstrelioff/dotfiles.git
$ cd dotfiles
$ chmod u+x deploy.py
$ ./deploy.py
```

notes
-----

* The deploy.py script is Python 3. If you want to use the script with Python
  2.7+ you'll have to change the shebang (at the top of the file) and handle
  the *print* statement/function in your preferred way -- we all should really
  move to Python 3.
* I have a .profile instead of .bash_profile or other file-- this is because I
  work on Ubuntu/Debian machines.  If you are on another OS, this file should
  be changed to the appropriate filename.

