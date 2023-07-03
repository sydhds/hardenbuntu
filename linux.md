## Linux

### sysctl

The linux kernel can be configured and hardened using sysctl.

Install the file provided in this repo:

    cp -v 100-hardenbuntu.conf /etc/sysctl.d/100-hardenbuntu.conf

Then check it with:

    sudo sysctl kernel.perf_event_paranoid
    sudo sysctl --all

Documentation:
* https://www.kernel.org/doc/html/latest/admin-guide/sysctl/kernel.html

Ref:
* https://madaidans-insecurities.github.io/guides/linux-hardening.html#sysctl
* https://wonderfall.space/linux-bricoles/

### Kernel boot parameters

**Warning 1**: Before enable any parameters, ensure you can modify and have access to the grub menu

    sudoedit /etc/default/grub
      set GRUB_TIMEOUT=5
      comment the line GRUB_TIMEOUT_STYLE
    sudo update-grub

In order to add parameters:

    sudoedit /etc/default/grub
      Add the flags to GRUB_CMDLINE_LINUX_DEFAULT
    sudo update-grub  

Add the following boot parameters in 

* intel_iommu=on amd_iommu=one
  * enable [io mmu](https://en.wikipedia.org/wiki/Input%E2%80%93output_memory_management_unit) in order to prevent dma attacks
* efi=disable_early_pci_dma
  * [improve iommu protection at boot](https://mjg59.dreamwidth.org/54433.html)  
* slab_nomerge
* vsyscall=none
  * https://lwn.net/Articles/446528/   

Ref:
* https://www.kernel.org/doc/html/v6.2/admin-guide/kernel-parameters.html 