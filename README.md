# xZ4PH0Dx_infra
xZ4PH0Dx Infra repository

## Homework 6

* Installed and initialized Terraform
* Created main configuration file main.tf
* Created output variables file
* Realized behavior of Terraform show and plan commands
* Added description of firewall rule to main.tf file
* Added provisioners to deploy puma service
* Created variables file and template for pushing to git repo

### Asterisk tasks:
* The ssh key will be deleted next time you execute terraform apply command because in main.tf there is not any mention about appuser_web ssh key. 
* There's one database server for one application. That's redundant and will make your program behavior unstable.

## Homework 5
 * Installed packer
 * Set up Application Default Credentials 
 * Created ubuntu16 template for packer and built the image reddit-base
 * Added additional user variables to ubuntu16 template
 * Created variables.json for security reasons of no showing private information
 * Created GCP vm using reddit-base image

## Tasks signed with asterisk:
 * Baked the image reddit-full
 * Created shell script to automatically deploy image to virtual machine
 
## How to run:
 To speed-up process of deploying image to virtual machine you could use that script:
``` bash
gcloud compute instances create reddit-app \
   --image-family reddit-full \
   --image-project=infra-207221 \
   --machine-type=g1-small \
   --tags puma-server \
   --network-interface network=default,subnet=default \
   --restart-on-failure
```
## How to get on site:
[Click here](http://35.195.116.156:9292/)

## Homework 4:
* Installed gcloud
* Created instance from
* Installed Ruby, Mongodb, Bundle
* Cloned and installed with Bundle reddit-app
* Created bash-scripts for installing and deploying an app
* Completed additional tasks

## IP Addresses:
```bash
testapp_IP = 35.233.115.197
testapp_port = 9292
```

## Additional tasks:

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
