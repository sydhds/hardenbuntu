## Ubuntu

Available security features:
* https://wiki.ubuntu.com/Security/Features

Security update news:
* https://ubuntu.com/blog/whats-new-in-security-for-ubuntu-22-04-lts
* https://ubuntu.com/blog/whats-new-in-security-for-ubuntu-21-10 
* https://ubuntu.com/blog/whats-new-in-security-for-ubuntu-21-04

Security podcast:
* https://ubuntusecuritypodcast.org/

### Wayland

Check that you are using wayland

    echo $XDG_SESSION_TYPE

If you want to check if an app is using XWayland, you can run:

    xlsclients

but sometimes some applications are not listed, so you can double-check with:

    xwininfo

when you hover over an xwayland window the mouse pointer will turn into a + sign. If you click the window it'll display 
some information and end, but it won't do anything with native Wayland windows.You can use Ctrl + C to end it.

### Pipewire

Check that you are using pipewire

    pactl info
        Check for line: Server Name: PulseAudio (on PipeWire 0.X.XX)

### Hardened malloc

* Ref: https://github.com/GrapheneOS/hardened_malloc
* **Warning**: 
  * [break java app?](https://github.com/GrapheneOS/hardened_malloc/issues/208)

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
    cat /proc/__PID__/maps | grep libhardened_malloc.so

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
    
### Sandbox apt

You can restrict the list of allowed system call for [apt](https://www.debian.org/releases/buster/amd64/release-notes/ch-whats-new.en.html#apt-sandboxing) (using [seccomp-BPF](https://www.kernel.org/doc/html/latest/userspace-api/seccomp_filter.html)):

    sudo cp -v 100sandbox /etc/apt/apt.conf.d/


