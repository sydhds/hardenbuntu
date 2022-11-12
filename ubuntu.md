### Ubuntu

Available security features:
* https://wiki.ubuntu.com/Security/Features

### Microcode

Microcode fixes some CPU vulnerabilites, so make sure that the following packages are installed:

    amd64-microcode
    intel-microcode

Verify if it is installed with:
    
    dpkg -l | grep microcode

Verify microcode loading:
    
    sudo journalctl -k --grep=microcode
    [or - deprecated] sudo dmesg | grep microcode

Verify if you are vulnerable to Spectre / Meltdown:
    
    sudo apt install spectre-meltdown-checker
    sudo spectre-meltdown-checker
    
    sudo cat /sys/devices/system/cpu/vulnerabilities/

Ref:
    https://madaidans-insecurities.github.io/guides/linux-hardening.html#microcode
    [spectre-meltdown-checker] https://github.com/speed47/spectre-meltdown-checker

TODO:
* check microcode version?
* verify manually if up to date?

### Firmware

Get latest firmwares for your hardware with:
    
    Gnome-firmware

Ref: https://gitlab.gnome.org/World/gnome-firmware


