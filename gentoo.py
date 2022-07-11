import os

def install(prog):
    os.system(f"emerge --ask=n --quiet {prog}")
