import os

def install(prog):
    os.system(f"pacman -S {prog}")

def add_arch_repo(root):
    mark = 0
    file = open("/etc/pacman.conf","r+")
    lines = file.readlines()
    for x in range(len(lines)):
        if "[galaxy]" in lines[x]:
            mark = x
            break
    print(lines)
    lines[mark+2:mark+2] = ["\n",
            "[universe]\n",
            "Server = https://mirror.pascalpuffke.de/artix-universe/$arch\n",
            "Server = https://universe.artixlinux.org/$arch\n",
            "Server = https://mirror1.artixlinux.org/universe/$arch\n",
            "Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/$arch\n",
            "Server = https://mirror1.cl.netactuate.com/artix/universe/$arch\n",
            "Server = https://ftp.crifo.org/artix-universe/\n",
            "\n"]
    file.close()
    file = open("/etc/pacman.conf","w")
    file.writelines(lines)
    file.close()
    os.system(f"{root} pacman -Syu")
    os.system(f"{root} pacman -S artix-archlinux-support")
    file = open("/etc/pacman.conf","r+")
    lines = file.readlines()
    lines[mark+10:mark+10] = ["\n",
            "[extra]\n",
            "Include = /etc/pacman.d/mirrorlist-arch\n",
            "\n",
            "[community]\n",
            "Include = /etc/pacman.d/mirrorlist-arch\n",
            "\n"]
    file.close()
    file = open("/etc/pacman.conf","w")
    file.writelines(lines)
    os.system(f"{root} pacman-key --populate archlinux")
