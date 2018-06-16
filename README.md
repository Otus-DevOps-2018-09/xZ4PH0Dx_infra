# xZ4PH0Dx_infra
xZ4PH0Dx Infra repository
Homework 3:

## IP Addresses:
bastion_IP=35.195.182.38
someinternalhost=10.166.0.2

One-line command to ssh to someinternalhost:
```bash
ssh -i ~/.ssh/appuser -A appuser@35.195.182.38 -t ssh 10.166.0.2
```

To pass to someinternalhost with _ssh someinternalhost_ you add to ~/.ssh/config file:
```bash
Host bastion
    User appuser
    Hostname 35.195.182.38
    Port 22
    IdentityFile ~/.ssh/appuser
    ForwardAgent yes
Host someinternalhost
    User appuser
    Hostname 10.166.0.2
    Port 22
    ForwardAgent yes
    ProxyCommand ssh bastion 'nc %h %p'
```
