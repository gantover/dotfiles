import os

def install(prog):
    os.system(f"pacman -S {prog}")
