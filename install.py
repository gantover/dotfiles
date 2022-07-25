#!/usr/bin/python
root = "doas"
import os
import artix
import gentoo

def get_user():
    users = os.popen("grep /bin/sh /etc/passwd").readlines()
    if len(users) > 2:
        print("This program only works with one users defined")
        quit()
    for user in users:
        if "root" not in user:
            return user.split(":")[0]
    
def is_root():
    root = os.popen("whoami").read().strip("\n")
    if root != "root":
        print("execute this program as root !")
        quit()

def get_os():
    kernel = os.popen("uname -r").read().strip("\n")
    for x in ["gentoo","artix"]:
        if x in kernel:
            return x
    print("os not compatible")
    quit()

def sl_install(url,user):
    # will clone my repo of suckless utilities and install them
    os.system(f"{root} -u {user} mkdir -p /home/{user}/documents/sl_progs/")
    os.system(f"{root} -u {user} git clone {url} /home/{user}/documents/sl_progs/")
    a = os.listdir(f"/home/{user}/documents/sl_progs/")
    for path in a:
        if path != ".git":
            os.system(f"make clean install -C /home/{user}/documents/sl_progs/{path}/ > /dev/null")

def read_progs(kernel):
    f = open("progs.txt","r").readlines()
    for x in f:
        elems = x.split(",")
        # instruction, program, infos
        if elems[0] == "artix" and kernel == "artix":
            artix.install(elems[1])
        elif elems[0] == "gentoo" and kernel == "gentoo":
            gentoo.install(elems[1])

def dot_files(user):
    os.system(f"{root} -u {user} stow /home/{user}/.dotfiles/main")

repos = ["courses", "scripts", "templates", "projects"]
def clone():
    for repo in repos:
        os.system(f"{root} -u {user} git clone git@github.com:gantover/{repo}.git /home/{user}/documents/")
    


is_root()
kernel = get_os()
user = get_user()
#sl_install("https://github.com/gantover/sl_progs.git",user)
#dot_files(user)
#read_progs(kernel)
artix.add_arch_repo(root)

