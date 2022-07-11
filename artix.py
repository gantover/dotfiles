import os

def install(prog):
    os.system(f"pacman --noconfirm --needed -S {prog}")
