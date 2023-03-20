## Hardware

### Microcode

Microcode fixes some CPU vulnerabilities, so make sure that the following packages are installed:

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
* https://madaidans-insecurities.github.io/guides/linux-hardening.html#microcode
* [spectre-meltdown-checker] https://github.com/speed47/spectre-meltdown-checker

TODO:
* check microcode version?
* verify manually if up to date?

### Firmware

Thanks to [LVFS](https://fwupd.org/), you can easily download and install firmware updates:

#### Setup

    sudo apt install fwupd

#### Update

List devices that can be updated by LVFS:

    sudo fwupdmgr get-devices

Refresh firmwares list:

    sudo fwupdmgr refresh 

Download updates:

    sudo fwupdmgr get-updates 

Update firmware(s)

    sudo fwupdmgr update

#### UI

    sudo apt install gnome-firmware

Doc: https://gitlab.gnome.org/World/gnome-firmware
