## Network

Firewalls can block incoming and outgoing network traffic. 

### UFW

Ufw stands for Uncomplicated Firewall. The easiest way to configure it is via Gufw.

### GUFW

```shell
sudo apt install gufw
```

Recommendations:
* Create a new profile like: HOME
* Block all incoming traffic (Incoming: Deny)
* [Paranoid] Block all Outgoing traffic, but then you will need to open ports for each application:
  * Open at least 80/tcp (HTTP), 443/tcp (HTTPS), 53/udp (DNS) for internet access
  * [optinal] remove all ipv6 rules (if you do not use IPV6)

### Check firewall rules

```shell
sudo ufw status
```

Note that some application can add some firewall rules (like Docker), so always double check with iptables:

```shell
sudo iptables -v -x -n -L
sudo iptables -t nat -v -x -n -L
```

