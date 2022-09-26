#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2016 Christopher C. Strelioff <chris.strelioff@gmail.com>
#
# Distributed under terms of the MIT license.

"""deploy.py

* Deploy dotfiles by creating a symbolic link to file in the repository
* A backup of the existing file is made using filename.bak-date format
"""
import os
import os.path
from collections import namedtuple
from datetime import date

today = date.today()
home_dir = os.getenv("HOME")
repo_dir = os.getcwd()
DotFile = namedtuple("DotFile", ["source", "destination"])


def setup():
    """Create list of dot files to check, backup and link (if needed)."""
    df_list = []

    # bash
    df_list.append(DotFile("bash_aliases", ".bash_aliases"))
    df_list.append(DotFile("bash_logout", ".bash_logout"))
    df_list.append(DotFile("bashrc", ".bashrc"))
    df_list.append(DotFile("profile", ".profile"))

    # other
    df_list.append(DotFile("editorconfig", ".editorconfig"))
    df_list.append(DotFile("gitconfig", ".gitconfig"))
    df_list.append(DotFile("screenrc", ".screenrc"))
    df_list.append(DotFile("tmux.conf", ".tmux.conf"))
    df_list.append(DotFile("vimrc", ".vimrc"))

    return df_list


def main():
    """Deploy specified dot files."""
    df_list = setup()

    files = len(df_list)
    changes = 0
    newfiles = 0
    for df in df_list:
        df_path = os.path.join(home_dir, df.destination)
        print("\n- Checking: {dest}".format(dest=df_path))

        if os.path.islink(df_path) and os.path.samefile(df.source, df_path):
            # the destination is a link and samefile says source and dest
            # are the same
            msg = ("  > {dest} exists; already *links* to source file\n"
                   "  > SKIPPING...").format(dest=df.destination)
            print(msg)
        elif os.path.isfile(df_path):
            # file exists; must make backup of file and link
            msg = ("  > {dest} exists; "
                   "however it is a file").format(dest=df.destination)
            print(msg)

            backup = df_path + ".bak-{}".format(str(today))
            os.rename(df_path, backup)
            os.symlink(os.path.join(repo_dir, df.source), df_path)
            msg2 = ("  > creating {bu}\n"
                    "  > making link to {src}").format(bu=backup,
                                                       src=df.source)
            print(msg2)
            changes += 1
        else:
            # no file or link - create symlink
            os.symlink(os.path.join(repo_dir, df.source), df_path)
            msg = ("  > {dest} does not exist as "
                   "file or link\n"
                   "  > making link to {src}\n").format(dest=df.destination,
                                                        src=df.source)
            print(msg)
            newfiles += 1

    msg_final = ("\n- dotfiles deployed!\n"
                 "  > Files: {fil} -[New files: {nf}]-[Changes: {chn}]\n"
                 "  > Details above...\n").format(fil=files,
                                                  nf=newfiles,
                                                  chn=changes)
    print(msg_final)

if __name__ == "__main__":
    main()
