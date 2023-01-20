### Ubuntu

Available security features:
* https://wiki.ubuntu.com/Security/Features

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
    https://madaidans-insecurities.github.io/guides/linux-hardening.html#microcode
    [spectre-meltdown-checker] https://github.com/speed47/spectre-meltdown-checker

TODO:
* check microcode version?
* verify manually if up to date?

### Firmware

Get latest firmwares for your hardware with:
    
    Gnome-firmware

Ref: https://gitlab.gnome.org/World/gnome-firmware

TODO: add shell commmands for an alternative way to deal with firmwares

### Wayland

Check that you are using wayland

    echo $XDG_SESSION_TYPE

TODO: add notes about X11

### Pipewire

Check that you are using pipewire

    pactl info
        Check for line: Server Name: PulseAudio (on PipeWire 0.X.XX)

### Hardened malloc

Ref: https://github.com/GrapheneOS/hardened_malloc

#### Install

* cd ~/dev
* git clone https://github.com/GrapheneOS/hardened_malloc.git
* cd hardened_malloc
* make
* sudo cp -v out/libhardened_malloc.so /usr/local/lib/
* EDITOR=nano sudoedit /etc/ld.so.preload
  * /usr/local/lib/libhardened_malloc.so
* EDITOR=nano sudoedit /etc/sysctl.d/hardened_malloc.conf
  * vm.max_map_count = 1048576
  
#### Checking

    meld
    ps -edf | grep meld # get pid of 'meld' process
    sudo cat /proc/__PID__/maps | grep libhardened_malloc.so

### Disable services

In order to reduce attack surface, you can disable unused services.

List running services:

    sudo systemctl --type=service --state=running

List active socket created by services:

    sudo systemctl --type=socket

Disable a service:

    sudo systemctl disable cups.service cups-browsed.service

Non-exhaustive list of services that can be disabled safely:

    cups / cups-browsed: Disable this if you don't use a Printer
    bluetooth: Disable this if you don't use any bluetooth devices
    avahi-daemon: ...
    [Untested] kerneloops.service: Unless you want to report Kernel crash?
    [Untested] switcheroo-control.service: Unless you have a dual GPU system
        Check with: sudo lshw -C display
    
