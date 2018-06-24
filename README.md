# xZ4PH0Dx_infra
xZ4PH0Dx Infra repository
## Homework 3:

## IP Addresses:

bastion_IP = 35.195.182.38
someinternalhost_IP = 10.166.0.2 

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
## Homework 4:
11

## IP Addresses:
```bash
testapp_IP = 35.198.167.169
testapp_port = 9292 
``` 

To automatically deploy and start our app you could use that gcloud command:
```bash
gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --network-interface network=default,subnet=default \
  --tags puma-server \
  --restart-on-failure \
  --metadata=startup-script-url='https://gist.githubusercontent.com/xZ4PH0Dx/7a0daad2347b7d62479b7332ea8e768f/raw/0f8b82da623526fa4de3653e69ab7ee544e777f6/startup_script.sh'
```

To add a firewall rule using gcloud you could use:
```bash
gcloud compute firewall-rules create default-puma-server \
--allow tcp:9292 \
--target-tags='puma-server'
```
