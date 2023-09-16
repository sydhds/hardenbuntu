# App sandbox

TODO introduction to sandboxing

## Snap

[Snap security overview](https://github.com/snapcore/snapd/wiki/snap-confine-Overview)

Snap:
* AppArmor profiles
  * In /var/lib/snapd/apparmor/profiles/
* Seccomp profiles
  * In /var/lib/snapd/seccomp/bpf/

## Snap confinements

* [Snap confinement explained](https://snapcraft.io/blog/demystifying-snap-confinement)
* Strict:
  * Default is to have very limited access to system resources; interface can be used to give more access
* Classic:
  * Have full system access (as traditionally packaged applications)
    * seccomp is set to: @unrestricted
    * TODO apparmor profile
* Devmode:
  * Only for Developers or packagers

## Snap interface

Display plug/slot used by a snap:

```shell
sudo snap connections chromium
```

Connect & Disconnect:

```commandline
sudo snap connect chromium:opengl
sudo snap disconnect chromium:opengl
```

Supported interfaces:
* ```snap interface```
* [Supported interaces](https://snapcraft.io/docs/supported-interfaces)

## Snap recommendations

* Use only Snaps from trusted publishers 
* Check if updates are published regularly
* For app with classic confinement, use firejail

## Firejail

sudo apt install firejail

### Launching an app

```shell
firejail vlc
```

### Checking Firejail sandbox

After launching an app using firejail, it is highly recommended to run:

```commandline
sudo jailcheck
```

As an example, this can provide some useful info like:

```
11164:USER::firejail gitg
   Warning: AppArmor not enabled
   Virtual dirs: /tmp, /var/tmp, /dev, /bin, /usr/share, /run/user/1000,
   Warning: I can read ~/.ssh
   Networking: enabled
```

So you can harden the launch of gitg like:

FIXME: hardened_malloc 
```commandline
firejail --apparmor --seccomp --nonewprivs --blacklist=~/.ssh --net=none --nodvd --noprinters --novideo --no3d gitg
```

Then you can create a custom profile to make it permanent:

TODO

### Firejail command line arguments

* --env=LD_PRELOAD='/usr/lib/libhardened_malloc.so': launch app with hardened malloc lib
* --whitelist / --blacklist: allow access or disallow access to a file or a folder
* --net=none: disable internet access
* --private: create a temporary HOME folder
  * TODO: --private=custom_folder

# TODO: clarify firejail + apparmor
# TODO: can firejail use the apparmor profile or seccomp from snap (e.g. snap vlc apparmor profile?)
# TODO: explore https://debugging.works/blog/debugging-firejail/

## AppArmor

Install additional apparmor profile:

```shell
sudo apt install apparmor-profiles
sudo dpkg -L apparmor-profiles
```

View the state of AppArmor kernel module:

```shell
sudo systemctl status apparmor.service
```

FIXME - View if everything is alright:

```shell
aa-enabled
```

View the current status of AppArmor profiles:

```shell
sudo apparmor_status
```

AppArmor's profiles have two modes of execution:

* Complaining/Learning: profile violations are permitted and logged. Useful for testing and developing new profiles.
* Enforced/Confined: enforces profile policy as well as logging the violation.

View an AppArmor profile:

```shell
cat /etc/apparmor.d/usr.bin.evince
```

View AppArmor profile violation:

```shell
sudo journalctl --since=yesterday | grep audit
```

TODO: explore https://doc.opensuse.org/documentation/leap/security/html/book-security/part-apparmor.html
TODO: https://github.com/roddhjav/apparmor.d

References:
* https://ubuntu.com/server/docs/security-apparmor
* https://wiki.archlinux.org/title/AppArmor
