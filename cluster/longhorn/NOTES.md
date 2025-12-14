1. Install on each node open-iscsi. (reference : https://wiki.archlinux.org/title/Open-iSCSI)

```bash
sudo pacman -Syu open-iscsi
```

2. Install longhorn : 

```bash
# 1. added longhorn chart
helm repo add longhorn https://charts.longhorn.io
helm repo update

# 2. Installing
helm install longhorn longhorn/longhorn -f values.yaml --namespace longhorn-system --create-namespace
```

