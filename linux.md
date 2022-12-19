## Linux

### sysctl

The linux kernel can be configured and then hardened using sysctl.

Edit and then install the file provided in this repo:

    cp -v 99-custom.conf /etc/sysctl.d/99-sysctl.conf

Documentation:
    https://www.kernel.org/doc/html/latest/admin-guide/sysctl/kernel.html

TODO:
    Check that 99-custom.conf is applied after already defined conf files

Ref:
    https://madaidans-insecurities.github.io/guides/linux-hardening.html#sysctl 
    https://wonderfall.space/linux-bricoles/
    
