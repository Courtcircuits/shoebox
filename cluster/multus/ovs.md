# OVS setup

On both nodes, install OVS:

```bash
pacman -Syu openvswitch
```

And enable it:

```bash
systemctl enable ovs-vswitchd
systemctl start ovs-vswitchd
```
