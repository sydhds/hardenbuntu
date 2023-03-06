## Linux

### sysctl

The linux kernel can be configured and then hardened using sysctl.

Edit and then install the file provided in this repo:

    cp -v 100-hardenbuntu.conf /etc/sysctl.d/100-hardenbuntu.conf

Then check it with:

    sudo sysctl kernel.perf_event_paranoid
    sudo sysctl --all

Documentation:
    https://www.kernel.org/doc/html/latest/admin-guide/sysctl/kernel.html

Ref:
    https://madaidans-insecurities.github.io/guides/linux-hardening.html#sysctl 
    https://wonderfall.space/linux-bricoles/